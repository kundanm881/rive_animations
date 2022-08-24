import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animations/rive/rive_car.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: RiveCar(),
      )),
    );
  }
}
