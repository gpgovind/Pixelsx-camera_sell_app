import 'package:camera_sell_app/utils/background_color.dart';
import 'package:camera_sell_app/view/pages/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/item_increase_and_degrees.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundColor(
      child: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 730.h,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0).r,
                  child: Column(
                    children: [
                      CustomCard(
                          cardHight: 350.h,
                          cardWidth: double.infinity,
                          elevation: 4,
                          radius: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'lib/assets/rating-icon.png',
                                          width: 23.w,
                                          height: 23.h,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text("4.8",
                                            style: TextStyle(
                                                fontSize: 19.311471939086914.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                        Text("(500 reviews)",
                                            style: TextStyle(
                                                fontSize: 19.311471939086914.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white))
                                      ],
                                    ),
                                    Image.asset(
                                      'lib/assets/camera photo-4.png',
                                      width: 150.w,
                                      height: 150.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Row(
                                      children: [
                                        customIncreaseButton,
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                        Text("01",
                                            style: TextStyle(
                                                fontSize: 24.498355865478516.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        customDegreesButton,
                                      ],
                                    )
                                  ],
                                ),
                                Positioned(
                                  right: 2,
                                  child: Column(
                                    children: [
                                      Text("SONY 200mm Zoom",
                                          style: TextStyle(
                                              fontSize: 22.519121170043945.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text("₹ 6000",
                                          style: TextStyle(
                                              fontSize: 17.863384246826172,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 200.w,
                                        child: Text(
                                          "Lorem ipsum dolor sit amet,At arcu varius ullamcorper eu varius  ",
                                          style: TextStyle(
                                            fontSize: 20.863384246826172.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      CustomCard(
                          cardHight: 350.h,
                          cardWidth: double.infinity,
                          elevation: 4,
                          radius: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'lib/assets/rating-icon.png',
                                          width: 23.w,
                                          height: 23.h,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text("4.8",
                                            style: TextStyle(
                                                fontSize: 19.311471939086914.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                        Text("(500 reviews)",
                                            style: TextStyle(
                                                fontSize: 19.311471939086914.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white))
                                      ],
                                    ),
                                    Image.asset(
                                      'lib/assets/camera photo-4.png',
                                      width: 150.w,
                                      height: 150.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Row(
                                      children: [
                                        customIncreaseButton,
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                        Text("01",
                                            style: TextStyle(
                                                fontSize: 24.498355865478516.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        customDegreesButton,
                                      ],
                                    )
                                  ],
                                ),
                                Positioned(
                                  right: 2,
                                  child: Column(
                                    children: [
                                      Text("SONY 200mm Zoom",
                                          style: TextStyle(
                                              fontSize: 22.519121170043945.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text("₹ 6000",
                                          style: TextStyle(
                                              fontSize: 17.863384246826172,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 200.w,
                                        child: Text(
                                          "Lorem ipsum dolor sit amet,At arcu varius ullamcorper eu varius  ",
                                          style: TextStyle(
                                            fontSize: 20.863384246826172.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      CustomCard(
                          cardHight: 350.h,
                          cardWidth: double.infinity,
                          elevation: 4,
                          radius: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'lib/assets/rating-icon.png',
                                          width: 23.w,
                                          height: 23.h,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text("4.8",
                                            style: TextStyle(
                                                fontSize: 19.311471939086914.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                        Text("(500 reviews)",
                                            style: TextStyle(
                                                fontSize: 19.311471939086914.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white))
                                      ],
                                    ),
                                    Image.asset(
                                      'lib/assets/camera photo-4.png',
                                      width: 150.w,
                                      height: 150.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Row(
                                      children: [
                                        customIncreaseButton,
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                        Text("01",
                                            style: TextStyle(
                                                fontSize: 24.498355865478516.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        customDegreesButton,
                                      ],
                                    )
                                  ],
                                ),
                                Positioned(
                                  right: 2,
                                  child: Column(
                                    children: [
                                      Text("SONY 200mm Zoom",
                                          style: TextStyle(
                                              fontSize: 22.519121170043945.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text("₹ 6000",
                                          style: TextStyle(
                                              fontSize: 17.863384246826172,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 200.w,
                                        child: Text(
                                          "Lorem ipsum dolor sit amet,At arcu varius ullamcorper eu varius  ",
                                          style: TextStyle(
                                            fontSize: 20.863384246826172.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: 170.h,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Color(0xff363940)),
                  child: const Column(
                    children: [
                      Row(children: [

                      ],)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}