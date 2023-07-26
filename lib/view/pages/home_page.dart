import 'dart:async';

import 'package:camera_sell_app/services/login.dart';
import 'package:camera_sell_app/utils/background_color.dart';
import 'package:camera_sell_app/view/pages/widgets/card.dart';
import 'package:camera_sell_app/view/pages/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/arrow_custom_button.dart';
import 'widgets/item_on_click.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> camera = [
    'lib/assets/splash camer -4.jpg',
    'lib/assets/splash camer -3.jpg',
    'lib/assets/splash camer -2.jpg',
    'lib/assets/splash camer -1.jpg'
  ];

  int currentIndex = 0;
  late Timer _imageChangeTimer;

  @override
  void initState() {
    super.initState();
    startImageChangeTimer();
  }

  void startImageChangeTimer() {
    _imageChangeTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % camera.length;
      });
    });
  }

  @override
  void dispose() {
    _imageChangeTimer.cancel(); // Cancel the timer in the dispose() method
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundColor(
      child: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'lib/assets/log_pixels-removebg-preview.png',
                      fit: BoxFit.cover,
                      height: 101.h,
                      width: 154.w,
                      color: Colors.white,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    IconButton(
                        iconSize: 45.sp,
                        onPressed: ()  {
                          singUserOut();
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomCard(
                    cardHight: 300.h,
                    cardWidth: 0.6.sh,
                    elevation: 3,
                    radius: 18.r,
                    margin: 7,
                    child: Stack(
                      children: [
                        Container(
                          width: 600.w,
                          height: 300.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18).r,
                              image: DecorationImage(
                                opacity: 0.5,
                                fit: BoxFit.cover,
                                image: AssetImage(camera[currentIndex]),
                              )),
                        ),
                        Positioned(
                          left: 15,
                          top: 25,
                          child: Column(
                            children: [
                              Text("New Vintage \nCollection",
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              const SizedBox(
                                height: 20,
                              ),
                              Card(
                                  color: Colors.transparent,
                                  elevation: 9,
                                  child: CustomButton(
                                      buttonName: 'Explore',
                                      hight: 60,
                                      radius: 25.r,
                                      width: 160))
                            ],
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Text("Popular",
                        style: TextStyle(
                            fontSize: 25.519121170043945.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ],
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 300.sh,
                  width: double.infinity,
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    children: [
                      CustomCard(
                          cardHight: 50.h,
                          cardWidth: 50.w,
                          elevation: 4,
                          radius: 18.r,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10,
                                left: 20,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'lib/assets/rating-icon.png',
                                      width: 20.w,
                                      height: 20.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Text("4.8",
                                        style: TextStyle(
                                            fontSize: 16.311471939086914.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                              Positioned(
                                // left: 4,
                                top: 30,
                                right: 50,
                                child: Image.asset(
                                  'lib/assets/camera photo-1.png',
                                  width: 130.w,
                                  height: 130.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 60.h,
                                left: 20.w,
                                child: Text("Canon EROS 600D",
                                    style: TextStyle(
                                        fontSize: 18.311471939086914.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                              Positioned(
                                  bottom: 10.h,
                                  right: 15.w,
                                  child: ArrowCustomButton(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ItemOnClick()),
                                      );
                                    },
                                  )),
                              Positioned(
                                bottom: 20.h,
                                left: 20.w,
                                child: Text("₹ 300000",
                                    style: TextStyle(
                                        fontSize: 18.311471939086914.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                            ],
                          )),
                      CustomCard(
                          cardHight: 300.h,
                          cardWidth: 200.w,
                          elevation: 4,
                          radius: 18.r,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10,
                                left: 20,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'lib/assets/rating-icon.png',
                                      width: 20.w,
                                      height: 20.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Text("4.8",
                                        style: TextStyle(
                                            fontSize: 16.311471939086914.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 50,
                                child: Image.asset(
                                  'lib/assets/camera photo -2.png',
                                  width: 130.w,
                                  height: 130.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 60.h,
                                left: 20.w,
                                child: Text("Canon EOS 30D",
                                    style: TextStyle(
                                        fontSize: 18.311471939086914.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                              Positioned(
                                  bottom: 10.h,
                                  right: 15.w,
                                  child: ArrowCustomButton(
                                    onTap: () {},
                                  )),
                              Positioned(
                                bottom: 20.h,
                                left: 20.w,
                                child: Text("₹ 120000",
                                    style: TextStyle(
                                        fontSize: 18.311471939086914.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                            ],
                          )),
                      CustomCard(
                          cardHight: 300.h,
                          cardWidth: 200.w,
                          elevation: 4,
                          radius: 18.r,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10,
                                left: 20,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'lib/assets/rating-icon.png',
                                      width: 20.w,
                                      height: 20.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Text("4.5",
                                        style: TextStyle(
                                            fontSize: 16.311471939086914.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 40,
                                child: Image.asset(
                                  'lib/assets/camera-image 5.png',
                                  width: 130.w,
                                  height: 130.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 60.h,
                                left: 20.w,
                                child: Text("SONY 23mm rs ",
                                    style: TextStyle(
                                        fontSize: 18.311471939086914.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                              Positioned(
                                  bottom: 10.h,
                                  right: 15.w,
                                  child: ArrowCustomButton(
                                    onTap: () {},
                                  )),
                              Positioned(
                                bottom: 20.h,
                                left: 20.w,
                                child: Text("₹ 50000",
                                    style: TextStyle(
                                        fontSize: 18.311471939086914.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                            ],
                          )),
                      CustomCard(
                          cardHight: 300.h,
                          cardWidth: 200.w,
                          elevation: 4,
                          radius: 18.r,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10,
                                left: 20,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'lib/assets/rating-icon.png',
                                      width: 20.w,
                                      height: 20.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Text("4.5",
                                        style: TextStyle(
                                            fontSize: 16.311471939086914.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 40,
                                child: Image.asset(
                                  'lib/assets/camera photo-4.png',
                                  width: 130.w,
                                  height: 130.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 60.h,
                                left: 20.w,
                                child: Text("SONY 200mm Zoom",
                                    style: TextStyle(
                                        fontSize: 18.311471939086914.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                              Positioned(
                                  bottom: 10.h,
                                  right: 15.w,
                                  child: ArrowCustomButton(
                                    onTap: () {},
                                  )),
                              Positioned(
                                bottom: 20.h,
                                left: 20.w,
                                child: Text("₹ 100000",
                                    style: TextStyle(
                                        fontSize: 18.311471939086914.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                            ],
                          )),
                      CustomCard(
                          cardHight: 300.h,
                          cardWidth: 200.w,
                          elevation: 4,
                          radius: 18.r,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10,
                                left: 20,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'lib/assets/rating-icon.png',
                                      width: 20.w,
                                      height: 20.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Text("4.5",
                                        style: TextStyle(
                                            fontSize: 16.311471939086914.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 50,
                                child: Image.asset(
                                  'lib/assets/camera-image 5.png',
                                  width: 130.w,
                                  height: 130.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 60.h,
                                left: 20.w,
                                child: Text("SONY 23mm rs ",
                                    style: TextStyle(
                                        fontSize: 18.311471939086914.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                              Positioned(
                                  bottom: 10.h,
                                  right: 15.w,
                                  child: ArrowCustomButton(
                                    onTap: () {},
                                  )),
                              Positioned(
                                bottom: 20.h,
                                left: 20.w,
                                child: Text("₹ 50000",
                                    style: TextStyle(
                                        fontSize: 18.311471939086914.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                            ],
                          )),
                      CustomCard(
                          cardHight: 300.h,
                          cardWidth: 200.w,
                          elevation: 4,
                          radius: 18.r,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 10,
                                left: 20,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'lib/assets/rating-icon.png',
                                      width: 20.w,
                                      height: 20.h,
                                      fit: BoxFit.cover,
                                    ),
                                    Text("4.5",
                                        style: TextStyle(
                                            fontSize: 16.311471939086914.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 50,
                                child: Image.asset(
                                  'lib/assets/camera photo-4.png',
                                  width: 130.w,
                                  height: 130.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 60.h,
                                left: 20.w,
                                child: Text("SONY 200mm Zoom",
                                    style: TextStyle(
                                        fontSize: 18.311471939086914.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                              Positioned(
                                  bottom: 10.h,
                                  right: 15.w,
                                  child: ArrowCustomButton(
                                    onTap: () {},
                                  )),
                              Positioned(
                                bottom: 20.h,
                                left: 20.w,
                                child: Text("₹ 100000",
                                    style: TextStyle(
                                        fontSize: 18.311471939086914.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
