import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final double cardWidth;
  final double cardHight;
  final double radius;
  final Widget child;
  final double elevation;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
   const CustomCard(
      {super.key,
      this.cardHight=0,
      this.cardWidth=0,
      this.padding,
      required this.child,
      required this.elevation,
      this.margin,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: Colors.transparent,
      child: Container(
        width: cardWidth.w,
        padding: padding,
        height: cardHight.h,
        margin:margin ,
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
