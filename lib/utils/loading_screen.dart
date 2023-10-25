import 'package:camera_sell_app/utils/const_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Widget loading({double? value}) {
  return Center(
    child: CircleAvatar(
      radius: 30,
      child: CircularProgressIndicator(
        color: Colors.blue,
        value: value,
      ),
    ),
  );
}

Widget esLoading({double? value}) {
  return CircularProgressIndicator(
    color: Colors.blue,
    value: value,
  );
}

void configEasyLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.blue
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.blue
    ..textColor = Colors.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

showConformationMessage({required void Function()? onPressed, context}) {
  Alert(
    style: AlertStyle(
        descStyle: TextStyle(color: Colors.white),
        titleStyle: TextStyle(color: Colors.white),
        backgroundColor: Color.fromRGBO(72, 76, 87, 1)),
    context: context,
    // type: AlertType.warning,

    desc: "Are you sure..",
    image: Image.asset(
      appLog,
      height: 100,
      width: 100,
    ),
    buttons: [
      DialogButton(
        child: Text(
          "logout",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: onPressed,
        color: Colors.red,
      ),
      DialogButton(
        child: Text(
          "cancel",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        color: Color.fromRGBO(0, 179, 134, 1.0),
      )
    ],
  ).show();
}
