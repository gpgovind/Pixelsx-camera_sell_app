import 'package:flutter/material.dart';

class BackgroundColor extends StatelessWidget {
  final Widget child;
  const BackgroundColor({super.key,required this.child});
 
  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
       begin: Alignment.topCenter,
       end: Alignment.bottomCenter,
      transform: GradientRotation(1.5),
      tileMode: TileMode.mirror,
      colors: [Color.fromRGBO(36, 44, 49, 1), Color.fromRGBO(72, 76, 87, 1)], // Specify the colors for the gradient
    ),
  ),
  child: child,
    );
  }
}

