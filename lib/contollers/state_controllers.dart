import 'package:flutter/material.dart';

class StateControllers {
  static final instance = StateControllers();
  final scaffoldMessenger = GlobalKey<ScaffoldMessengerState>();
  final navigator = GlobalKey<NavigatorState>();

  bool isDialogOpen = false;

  showNavDialog() {
    isDialogOpen = true;
    print(isDialogOpen);
    return showDialog(
      context: navigator.currentContext!,
      builder: (context) {
        return Center(
          child: Container(child: Text("kundan")),
        );
      },
    ).then((value) {
      if (value == null) {
        isDialogOpen = false;
      }
      print(isDialogOpen);
    });
  }

  clsDialog() {}
}
