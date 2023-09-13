import 'package:camera_sell_app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GestureDetector adminCustomButton({text, void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: CustomCard(
        cardHight: 77,
        radius: 22,
        cardWidth: double.infinity,
        colors: const [
          Color.fromRGBO(50, 52, 59, 1),
          Color.fromRGBO(72, 76, 87, 1),
          Color.fromRGBO(29, 31, 35, 1),
        ],
        border: Border.all(
          width: 0.5,
          color: const Color.fromRGBO(146, 146, 146, 1),
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(
                fontSize: 25.5.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(255, 255, 255, 1),
              )),
        )),
  );
}
