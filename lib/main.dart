import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive_animations/home_page.dart';
import 'package:rive_animations/rive/rive_car_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      initialBinding: ControllerBindings(),
    );
  }
}

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(RiveCarController());
  }
}
