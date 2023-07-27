import 'package:camera_sell_app/utils/background_color.dart';
import 'package:camera_sell_app/view/pages/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundColor(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 10.sh,
              child: Column(children: [
                CustomCard(
                    cardHight: 250.h,
                    cardWidth: double.infinity,
                    elevation: 6,
                    radius: 18,
                    child: Row(
                      children: [
                        Transform.translate(
                          offset: const Offset(21.0, 15.0),
                          child: Image.asset(
                            'lib/assets/camera photo -2.png',
                            fit: BoxFit.cover,
                            width: 151.w,
                            height: 137.h,
                          ),
                        ),
                        SizedBox(
                          width: 70.w,
                        ),
                        Text("DSLR Cameras",
                            style: TextStyle(
                                fontSize: 25.519121170043945.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white))
                      ],
                    )),
                SizedBox(
                  height: 10.h,
                ),
                CustomCard(
                    cardHight: 250.h,
                    cardWidth: double.infinity,
                    elevation: 6,
                    radius: 18,
                    child: Row(
                      children: [
                        Transform.translate(
                          offset: const Offset(21.0, 5.0),
                          child: Image.asset(
                            'lib/assets/camera photo-4.png',
                            fit: BoxFit.cover,
                            width: 151.w,
                            height: 137.h,
                          ),
                        ),
                        SizedBox(
                          width: 70.w,
                        ),
                        Text("Film Cameras",
                            style: TextStyle(
                                fontSize: 25.519121170043945.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white))
                      ],
                    )),
                SizedBox(
                  height: 10.h,
                ),
                CustomCard(
                    cardHight: 250.h,
                    cardWidth: double.infinity,
                    elevation: 6,
                    radius: 18,
                    child: Row(
                      children: [
                        Transform.translate(
                          offset: const Offset(17.0, 20.0),
                          child: Image.asset(
                            'lib/assets/camera photo-1.png',
                            fit: BoxFit.cover,
                            width: 151.w,
                            height: 137.h,
                          ),
                        ),
                        SizedBox(
                          width: 70.w,
                        ),
                        Text("Point-and-Shoot \nCameras",
                            style: TextStyle(
                                fontSize: 25.519121170043945.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white))
                      ],
                    )),
                SizedBox(
                  height: 10.h,
                ),
                CustomCard(
                    cardWidth: double.infinity,
                    cardHight: 250.h,
                    elevation: 6,
                    radius: 18,
                    child: Row(
                      children: [
                        Transform.translate(
                          offset: const Offset(40.0, 2.0),
                          child: Image.asset(
                            'lib/assets/camera -5.png',
                            fit: BoxFit.cover,
                            width: 100.w,
                            height: 100.h,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                        ),
                        Text("Action Cameras",
                            style: TextStyle(
                                fontSize: 25.519121170043945.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white))
                      ],
                    )),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
