import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rive_animations/contollers/state_controllers.dart';
import 'package:rive_animations/pix.dart';
import 'package:rive_animations/rive/rive_car_controller.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        navigatorKey: StateControllers.instance.navigator,
        scaffoldMessengerKey: StateControllers.instance.scaffoldMessenger,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const Pix(),
        initialBinding: ControllerBindings(),
      ),
    );
  }
}

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(RiveCarController());
  }
}
