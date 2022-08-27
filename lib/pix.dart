import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive_animations/contollers/state_controllers.dart';

class Pix extends StatelessWidget {
  const Pix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 100.h,
        width: 300.w,
        color: Colors.pink,
        child: Center(
            child: InkWell(
          onTap: () => StateControllers.instance.showNavDialog(),
          child: Text(
            "kundan",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 20.sp),
            // textScaleFactor: MediaQuery.textScaleFactorOf(context),
          ),
        )),
      ),
    ));
  }
}
