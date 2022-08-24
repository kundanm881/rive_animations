import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

String idle = "idle";
String curves = "curves";
String bounce = "bounce";
String bumpy = "bumpy";

class RiveCarController extends GetxController {
  static final instance = Get.find<RiveCarController>();

  Artboard? artboard;
  RiveAnimationController? riveAnimationController;
  SMITrigger? _bump;

  getArtBoard() async {
    await rootBundle.load("assets/vehicles.riv").then((v) async {
      RiveFile file = RiveFile.import(v);
      artboard = file.mainArtboard;
    });

    update();
  }

  _animationByName({required String animationByName}) {
    return riveAnimationController = SimpleAnimation(animationByName);
  }

  bounceAnim() {
    artboard!.addController(_animationByName(animationByName: bounce));
    artboard!.removeController(_animationByName(animationByName: bounce));
    artboard!.sortDependencies();
    update();
  }

  curveAnim() {
    artboard!.addController(_animationByName(animationByName: curves));
    update();
  }

  idleAnim() {
    final controller = StateMachineController.fromArtboard(artboard!, 'bumpy');
    artboard!.addController(controller!);
    _bump = controller.findInput<bool>('bump') as SMITrigger;
    _bump!.fire();
    // update();
  }
}
