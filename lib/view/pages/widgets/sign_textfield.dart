import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignTextField extends StatelessWidget {
  final String image;

  final String hintText;
  const SignTextField({super.key, required this.hintText, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          height: 25.h,
          color: Colors.white,
          width: 21.875.w,
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          width: 360.w,
          height: 70.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0x993e3c3c),
                  Color(0x33ffffff),
                  Color(0x33ffffff)
                ],
              )),
          child: Center(
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
