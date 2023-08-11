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
    return Container(
      width: width,
      height: hight,
      padding: const EdgeInsets.all(0.8),
      decoration: BoxDecoration(
         borderRadius:borderRadius,
          color: const Color(0x356b7180),
          border: Border.all(
            width: 1,
            color: const Color.fromRGBO(153, 153, 153, 1),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          action,
          SizedBox(
            width: 20.w,
          ),
          status,
          SizedBox(
            width: 30.w,
          ),
          name,
        ],
      ),
    );
  }
}
