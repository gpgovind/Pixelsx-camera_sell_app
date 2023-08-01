import 'package:camera_sell_app/view/pages/welcome%20screen%20and%20auth%20screen/login_screen.dart';
import 'package:camera_sell_app/view/pages/welcome%20screen%20and%20auth%20screen/sign_screen.dart';
import 'package:camera_sell_app/utils/sing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/background_color.dart';
import '../../../utils/login_button.dart';
import '../../../utils/navigation.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
                      CustomNavigator.navigationPush(
                          context: context, child: SignScreen());
                    },
                    child: customSignButton),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {
                      CustomNavigator.navigationPush(
                          context: context, child: const LoginScreen());
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
