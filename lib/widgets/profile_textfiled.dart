import 'package:camera_sell_app/utils/const_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomNewTextFiled extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  final double height;
  final double width;
  final String? text;
  final String? validatorText;
  final String hintText;
  final bool? enabled;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? maxLines;
  CustomNewTextFiled(
      {super.key,
      this.text = '',
      this.validatorText = '',
      this.enabled,
      this.width = 360,
      required this.hintText,
      required this.height,
      this.maxLines = 1,
      required this.keyboardType,
      this.obscureText = false,
      required this.controller});

  @override
  State<CustomNewTextFiled> createState() => _CustomNewTextFiledState();
}

class _CustomNewTextFiledState extends State<CustomNewTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          child: Text(widget.text!,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: customTextColor)),
        ),
        Container(
          width: widget.width.w,
          height: widget.height,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: const Color(0x356b7180),
          ),
          child: Center(
            child: TextFormField(
              enabled: widget.enabled,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return widget.validatorText;
                }
                return null;
              },
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText,
              maxLines: widget.maxLines,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Colors.white70,
                ),
              ),
              style: TextStyle(color: customTextColor),
            ),
          ),
        ),
      ],
    );
  }
}
