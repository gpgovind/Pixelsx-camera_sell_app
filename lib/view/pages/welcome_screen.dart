import 'package:camera_sell_app/view/pages/login_screen.dart';
import 'package:camera_sell_app/view/pages/sign_screen.dart';
import 'package:camera_sell_app/utils/sing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/background_color.dart';
import '../../utils/login_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundColor(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Center(
            child: Stack(
                  children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250.h,
                  width: 300.w,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'lib/assets/log_pixels-removebg-preview.png'))),
                ),
                 const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignScreen()),
                      );
                    },
                    child: customSignButton),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  LoginScreen()),
                      );
                    },
                    child: customLoginButton)
              ],
            ),
                  ],
                ),
          )),
    ));
  }
}
