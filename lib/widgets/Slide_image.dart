

import 'package:camera_sell_app/utils/const_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideImage extends StatelessWidget {
  const SlideImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageSlideshow(
        width: double.infinity,
        height: 300.h,
        initialPage: 0,
        indicatorRadius: 6.r,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        onPageChanged: (value) {
          
        },
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.color),
            child: Image.asset(
              slideImage1,
              fit: BoxFit.cover,
            ),
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.color),
            child: Image.asset(
             slideImage4,
              fit: BoxFit.cover,
            ),
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.color),
            child: Image.asset(
              slideImage5,
              fit: BoxFit.cover,
            ),
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.color),
            child: Image.asset(
              slideImage3,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
