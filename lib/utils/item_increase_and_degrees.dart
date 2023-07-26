import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customIncreaseButton = Card(
  elevation: 8,
  color: Colors.transparent,
  child: Container(
    width: 40.83059310913086.w,
    height: 40.83059310913086.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8), // Add border radius

      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xff616670), Color(0x004a4d55)],
      ),
    ),
    child: const Center(
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    ),
  ),
);
Widget customDegreesButton = Card(
  elevation: 8,
  color: Colors.transparent,
  child: Container(
    width: 40.83059310913086.w,
    height: 40.83059310913086.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8), // Add border radius
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xff616670), Color(0x004a4d55)],
      ),
    ),
    child: const Center(
      child: Icon(
        Icons.remove,
        color: Colors.white,
      ),
    ),
  ),
);
