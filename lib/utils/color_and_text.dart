import 'package:flutter/material.dart';

Color customTextColor = const Color.fromRGBO(255, 255, 255, 1);
Color customAppBarColor = const Color.fromRGBO(54, 57, 65, 1);

Text customText({text, FontWeight? fontWeight, double? fontSize}) => Text(
      text,
      style: TextStyle(
          color: customTextColor, fontWeight: fontWeight, fontSize: fontSize),
    );
