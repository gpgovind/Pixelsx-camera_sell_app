import '../../../utils/const_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/widget_path.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return backgroundColor(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        bottomNavigationBar:
         
            Container(
              width: double.infinity,
              height: 280.h,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color(0xff363940)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 20),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Order Info",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                            Text("₹ 110",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shipping cost",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                            Text("₹ 10",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white))
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.red)),
                            Text("₹ 120000",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red))
                          ],
                        ),
                         SizedBox(
                          height: 20.h,
                        ),
                        customCheckOutButton
                      ],
                    ),
                  ],
                ),
              ),
          
        ) ,
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 10.sh,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: Column(
                      children: [
                        CustomCard(
                            colors: const [
                              Color.fromRGBO(50, 52, 59, 1),
                              Color.fromRGBO(72, 76, 87, 1),
                              Color.fromRGBO(29, 31, 35, 1),
                            ],
                            cardHight: 350.h,
                            cardWidth: double.infinity,
                            elevation: 4,
                            radius: 18,
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
                            colors: const [
                              Color.fromRGBO(50, 52, 59, 1),
                              Color.fromRGBO(72, 76, 87, 1),
                              Color.fromRGBO(29, 31, 35, 1),
                            ],
                            cardHight: 350.h,
                            cardWidth: double.infinity,
                            elevation: 4,
                            radius: 18,
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
                                          Text("4.2",
                                              style: TextStyle(
                                                  fontSize: 19.311471939086914.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white)),
                                          SizedBox(
                                            width: 10.h,
                                          ),
                                          Text("(200 reviews)",
                                              style: TextStyle(
                                                  fontSize: 19.311471939086914.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white))
                                        ],
                                      ),
                                      Image.asset(
                                        'lib/assets/camera-image 5.png',
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
                                        const Text("₹ 80000",
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
                            colors: const [
                              Color.fromRGBO(50, 52, 59, 1),
                              Color.fromRGBO(72, 76, 87, 1),
                              Color.fromRGBO(29, 31, 35, 1),
                            ],
                            cardHight: 350.h,
                            cardWidth: double.infinity,
                            elevation: 4,
                            radius: 18,
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
                                          Text("4.1",
                                              style: TextStyle(
                                                  fontSize: 19.311471939086914.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white)),
                                          SizedBox(
                                            width: 10.h,
                                          ),
                                          Text("(5100 reviews)",
                                              style: TextStyle(
                                                  fontSize: 19.311471939086914.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white))
                                        ],
                                      ),
                                      Image.asset(
                                        'lib/assets/camera photo -2.png',
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
                                        const Text("₹ 12000",
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
                            colors: const [
                              Color.fromRGBO(50, 52, 59, 1),
                              Color.fromRGBO(72, 76, 87, 1),
                              Color.fromRGBO(29, 31, 35, 1),
                            ],
                            cardHight: 350.h,
                            cardWidth: double.infinity,
                            elevation: 4,
                            radius: 18,
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
                                        'lib/assets/camera-image 5.png',
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
              
            ],
          ),
        ),
      ),
    );
  }
}
