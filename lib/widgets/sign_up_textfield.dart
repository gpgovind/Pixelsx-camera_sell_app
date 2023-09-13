import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String image;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;

  const CustomTextField(
      {super.key,
      required this.hintText,
      this.keyboardType,
      this.obscureText = false,
      required this.image,
      this.validator,
      required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          widget.image,
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
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              validator: widget.validator,
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: widget.hintText,
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
