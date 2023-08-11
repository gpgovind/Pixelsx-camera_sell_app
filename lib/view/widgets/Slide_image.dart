import 'dart:developer';

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
        height: 200,
        initialPage: 0,
        indicatorRadius: 6.r,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        onPageChanged: (value) {
          log('image slide page changed: $value');
        },
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.color),
            child: Image.asset(
              'lib/assets/splash camer -4.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.color),
            child: Image.asset(
              'lib/assets/splash camer -3.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.color),
            child: Image.asset(
              'lib/assets/splash camer -2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.color),
            child: Image.asset(
              'lib/assets/splash camer -1.jpg',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
