import 'package:camera_sell_app/utils/const_path.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final Widget child;
  const BackgroundImage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
           colorFilter: ColorFilter.mode(Colors.black54,BlendMode.softLight ),
              fit: BoxFit.cover,
              image: AssetImage(backgroundImage))),
      child: child,
    );
  }
}
