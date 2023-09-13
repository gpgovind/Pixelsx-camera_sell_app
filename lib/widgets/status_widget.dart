import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container statusWidget = Container(
  width: double.infinity,
  height: 100.h,
  padding: const EdgeInsets.all(0.8),
  decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18), topRight: Radius.circular(18)),
      color: const Color(0x356b7180),
      border: Border.all(
        width: 1,
        color: const Color.fromRGBO(153, 153, 153, 1),
      )),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const Text("Status",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white54)),
      SizedBox(
        width: 5.w,
      ),
      const Text("Action",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white54)),
      SizedBox(
        width: 5.w,
      ),
      const Text("Name",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white54)),
    ],
  ),
);
