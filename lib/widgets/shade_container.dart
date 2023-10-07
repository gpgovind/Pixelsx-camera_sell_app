import 'package:flutter/cupertino.dart';

class ShadeContainer extends StatelessWidget {
  final Widget child;
  final BoxBorder? border;
  final double? radius;
  final double? height;
  final double? elevation;
  final double? width;
  const ShadeContainer(
      {super.key,
      required this.child,
      this.border,
      this.radius,
      this.height,
      this.width,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(72, 76, 87, 1), // Shadow color
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
          border: border,
          borderRadius: BorderRadius.circular(radius ?? 0),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(50, 52, 59, 1),
              Color.fromRGBO(72, 76, 87, 1),
              Color.fromRGBO(29, 31, 35, 1),
            ],
          ),
        ),
        child: Container(
          height: height,
          decoration: BoxDecoration(
              border: border,
              color: CupertinoColors.lightBackgroundGray
                  .withOpacity(0.1)
                  .withOpacity(00.1),
              borderRadius: BorderRadius.circular(radius ?? 0)),
          child: child,
        ),
      ),
    );
  }
}
