import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final double hight;
  final double width;
  final double radius;
  final bool loading;
  const CustomButton(
      {super.key,
      required this.buttonName,
      required this.hight,
      required this.radius,
      this.loading = false,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight.h,
      width: width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius), // Add border radius

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
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(buttonName,
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white))),
    );
  }
}
