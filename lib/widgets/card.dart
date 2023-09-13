import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final double cardWidth;
  final double cardHight;
  final double radius;
  final Widget child;
  
  final List<Color>? colors; // Add a "?" to make it nullable
  final BoxBorder? border;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const CustomCard({
    super.key,
    // Use "Key?" to make it nullable
    this.cardHight = 0,
    this.cardWidth = 0,
    this.colors,
    this.border,
    this.padding,
    required this.child,
   
    this.margin,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth.w,
      padding: padding,
      height: cardHight.h,
      margin: margin,
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(radius).r,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: colors ??
              [
                const Color.fromRGBO(50, 52, 59, 1),
                const Color.fromRGBO(72, 76, 87, 1),
                const Color.fromRGBO(29, 31, 35, 1),
              ],
        ),
      ),
      child: child,
    );
  }
}
