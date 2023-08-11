import 'package:flutter/material.dart';

Widget backgroundColor({required Widget child}){
    return Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
       begin: Alignment.topCenter,
       end: Alignment.bottomCenter,
      transform: GradientRotation(1.5),
      tileMode: TileMode.mirror,
      colors: [Color.fromRGBO(36, 44, 49, 1), Color.fromRGBO(72, 76, 87, 1)], // Specify the colors for the gradient
    ),
  ),
  child: child,
    );
}

