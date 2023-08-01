import 'package:flutter/material.dart';
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

Widget neoPopBtnNew({required String text}) => NeoPopButton(
      color: const Color.fromRGBO(153, 153, 153, 1),
      bottomShadowColor: Colors.white30,
      rightShadowColor: Colors.white30,
      animationDuration: const Duration(microseconds: 5000),
      leftShadowColor: Colors.white,
      depth: 4,
      onTapUp: () {},
      border: Border.all(
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
