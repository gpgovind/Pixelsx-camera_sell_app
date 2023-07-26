import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LoginTextField extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  final double height;
  final String image;
  final String hintText;
  LoginTextField(
      {super.key,
      required this.image,
      required this.hintText,
      required this.height,
      required this.controller});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   widget.controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          widget.image,
          height: widget.height,
          width: 21.875.w,
          color: Colors.white,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
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
