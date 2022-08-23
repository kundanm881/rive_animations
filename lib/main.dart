import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LiquidDownload(),
    );
  }
}

/// An example showing how to drive a StateMachine via a trigger and number
/// input.
class LiquidDownload extends StatefulWidget {
  const LiquidDownload({Key? key}) : super(key: key);

  @override
  _LiquidDownloadState createState() => _LiquidDownloadState();
}

class _LiquidDownloadState extends State<LiquidDownload> {
  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  StateMachineController? _controller;
  // SMIInput<bool>? _start;
  // SMIInput<double>? _progress;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/2857-5946-windy-tree.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard
          ..addController(SimpleAnimation("Animation 1"));
        for (var element in artboard.animations) {
          print(element.name);
        }
        // print(artboard.stateMachines.length);
        var c = StateMachineController.fromArtboard(artboard, "bumpy");
        // print(c.);

        // var controller =
        //     StateMachineController.fromArtboard(artboard, 'Download');
        // if (controller != null) {
        //   artboard.addController(controller);
        //   _start = controller.findInput('Download');
        //   _progress = controller.findInput('Progress');
        // }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Liquid Download'),
      ),
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Press to activate, slide for progress...',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Rive(
                      artboard: _riveArtboard!,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
