import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/neopop.dart';

Widget neoPopBtn({required String text, void Function()? onTapUp}) => Container(
      padding: const EdgeInsets.all(0.6),
      child: NeoPopTiltedButton(
        isFloating: true,
        onTapUp: onTapUp,
        decoration: const NeoPopTiltedButtonDecoration(
            color: Color.fromRGBO(107, 113, 129, 1),
            plunkColor: Color.fromRGBO(107, 113, 129, 1),
            shadowColor: Colors.black),
        child: NeoPopShimmer(
          shimmerColor: Colors.white,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10),
              child: Text(text,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white))),
        ),
      ),
    );

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
            Text(text, style: TextStyle(color: textColor, fontSize: 15)),
          ],
        ),
      ),
    );
