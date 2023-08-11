import '../../../utils/const_path.dart';
import '../../widgets/widget_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return backgroundColor(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomCard(
                      border: Border.all(
                        width: 2,
                        color: const Color.fromRGBO(146, 146, 146, 1),
                      ),
                      cardWidth: 550.w,
                      cardHight: 350.h,
                      colors: const [
                        Color(0x356b7180),
                        Color(0x356b7180),
                        Color(0x356b7180),
                      ],
                      elevation: 3,
                      radius: 22,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("Dashboard",
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomCard(
                                    cardHight: 150.w,
                                    cardWidth: 200.h,
                                    elevation: 2,
                                    radius: 18,
                                    border: Border.all(
                                      width: 2,
                                      color: const Color.fromRGBO(
                                          146, 146, 146, 1),
                                    ),
                                    colors: const [
                                      Color(0x356b7180),
                                      Color(0x356b7180),
                                      Color(0x356b7180),
                                    ],
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Total sales",
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white)),
                                        Text("100k",
                                            style: TextStyle(
                                                fontSize: 25.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white))
                                      ],
                                    )),
                                CustomCard(
                                    cardHight: 150.w,
                                    cardWidth: 200.h,
                                    elevation: 1,
                                    radius: 18,
                                    border: Border.all(
                                      width: 2,
                                      color: const Color.fromRGBO(
                                          146, 146, 146, 1),
                                    ),
                                    colors: const [
                                      Color(0x356b7180),
                                      Color(0x356b7180)
                                    ],
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Total products",
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white)),
                                        Text("100",
                                            style: TextStyle(
                                                fontSize: 25.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white))
                                      ],
                                    )),
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      );
   
  }
}
