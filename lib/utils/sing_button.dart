import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container customSignButton = Container(
  height: 60.h,
  width: 320.w,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20), // Add border radius
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5), // Shadow color
        spreadRadius: 1, // Spread radius
        blurRadius: 2, // Blur radius
        offset: Offset(0, 3), // Shadow offset
      ),
    ],
      border: Border.all(color: Colors.white),
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      transform: GradientRotation(1.5),
      tileMode: TileMode.mirror,
      colors: [
        Color.fromRGBO(36, 44, 49, 1),
        Color.fromRGBO(72, 76, 87, 1)
      ], // Specify the colors for the gradient
    ),
  ),
  child: Center(
    child: Text(
      'Sign',
      style: TextStyle(color: Colors.white, fontSize: 24.sp),
    ),
  ), // Your widget tree goes here
);
