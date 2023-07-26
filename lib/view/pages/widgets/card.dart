import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final double cardWidth;
  final double cardHight;
  final double radius;
  final Widget child;
  final double elevation;
  final double margin;
  const CustomCard(
      {super.key,
      required this.cardHight,
      required this.cardWidth,
      required this.child,
      required this.elevation,
      this.margin=0,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: Colors.transparent,
      child: Container(
        width: cardWidth.w,
        height: cardHight.h,
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius).r,
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              
              colors: [
                Color.fromRGBO(50, 52, 59, 1),
                Color.fromRGBO(72, 76, 87, 1),
                Color.fromRGBO(29, 31, 35, 1),
              ],
            )),
        child: child,
      ),
    );
  }
}
