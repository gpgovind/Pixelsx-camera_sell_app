import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customFrontButton({void Function()? onTap, required String text}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: 320.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // Add border radius

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color

              spreadRadius: 1, // Spread radius

              blurRadius: 2, // Blur radius

              offset: const Offset(0, 3),
            ),
          ],

          border: Border.all(color: Colors.white), // Add border color

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
            text, // Update the text to 'Login'

            style: TextStyle(color: Colors.white, fontSize: 24.sp),
          ),
        ),
      ),
    );
