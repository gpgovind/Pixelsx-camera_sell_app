
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/background_color.dart';
import '../../../utils/custom_front_button.dart';
import '../../../utils/navigation.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return backgroundColor(
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
                customFrontButton(
                    text: 'Sign Up',
                    onTap: () {
                      CustomNavigator.navigationPush(
                          context: context, child: const SignUpScreen());
                    }),
                const SizedBox(
                  height: 30,
                ),
                customFrontButton(
                    text: 'Login',
                    onTap: () {
                      CustomNavigator.navigationPush(
                          context: context, child: const LoginScreen());
                    }),
              ],
            ),
          ],
        ),
      )),
    ));
  }
}
