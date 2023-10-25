import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/neopop.dart';

Widget neoPopBtnNew(
        {required String text,
        Color? bottomShadowColor,
        Color? rightShadowColor,
        required Color color,
        double vertical = 0.0,
        double horizontal = 0.0,
        Color? textColor,
        void Function()? onTapUp,
        Color? leftShadowColor}) =>
    NeoPopButton(
      color: color,
      bottomShadowColor: bottomShadowColor,
      rightShadowColor: rightShadowColor,
      animationDuration: const Duration(microseconds: 5000),
      leftShadowColor: leftShadowColor,
      depth: 4,
      onTapUp: onTapUp,
      onTapDown: () => HapticFeedback.vibrate(),
      border: Border.all(
        color: Colors.black,
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: TextStyle(color: textColor, fontSize: 15,fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
