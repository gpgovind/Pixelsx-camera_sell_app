import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserManageCard extends StatelessWidget {
  final Widget name;
  final Widget status;
  final Widget action;
  final double width;
  final double hight;
  final BorderRadiusGeometry? borderRadius;
  const UserManageCard(
      {super.key,
      required this.action,
      this.borderRadius,
      required this.name,
      required this.status,
      required this.hight,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          action,
          SizedBox(
            width: 20.w,
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: status),
          SizedBox(
            width: 30.w,
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: name),
        ],
      );
    
  }
}
