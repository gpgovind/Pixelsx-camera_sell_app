import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
