import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ArrowCustomButton extends StatelessWidget {
  void Function()? onTap;
  ArrowCustomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.transparent,
        child: Container(
          width: 40.07025718688965.w,
          height: 30.757160186767578.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.425268650054932),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff6f757f), Color(0x001f2125)],
              )),
          child: const Center(
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
