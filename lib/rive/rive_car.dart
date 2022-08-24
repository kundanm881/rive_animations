import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:rive_animations/rive/rive_car_controller.dart';

class RiveCar extends StatefulWidget {
  const RiveCar({Key? key}) : super(key: key);

  @override
  State<RiveCar> createState() => _RiveCarState();
}

class _RiveCarState extends State<RiveCar> {
  @override
  void initState() {
    super.initState();
    RiveCarController.instance.getArtBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<RiveCarController>(builder: (snap) {
          return (snap.artboard == null)
              ? const Text("Wait")
              : SizedBox(
                  height: 400,
                  // width: 400,
                  child: Rive(artboard: snap.artboard!));
        }),
        //
        ElevatedButton(
            onPressed: () {
              RiveCarController.instance.bounceAnim();
            },
            child: Text(bounce)),
        ElevatedButton(
            onPressed: () {
              RiveCarController.instance.curveAnim();
            },
            child: Text(curves)),
        ElevatedButton(
            onPressed: () {
              RiveCarController.instance.idleAnim();
            },
            child: Text(idle))
      ],
    );
  }
}
