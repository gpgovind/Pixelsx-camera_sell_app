import 'package:camera_sell_app/utils/background_image.dart';
import 'package:camera_sell_app/view/pages/widgets/bottom_nav.dart';
import 'package:camera_sell_app/view/pages/widgets/custom_button.dart';
import 'package:camera_sell_app/view/pages/widgets/sign_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: SafeArea(
            child: SizedBox(
          height: 800.h,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 100,
              ),
              child: Column(
                children: [
                  const Text("Welcome ",
                      style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                  const Text("Create your account",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.white)),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 22, right: 20),
                    child: const Column(
                      children: [
                        SignTextField(
                            hintText: 'Username',
                            image: 'lib/assets/user icon.png'),
                        SizedBox(
                          height: 10,
                        ),
                        SignTextField(
                            hintText: 'Email',
                            image: 'lib/assets/mail-icon2.png'),
                        SizedBox(
                          height: 10,
                        ),
                        SignTextField(
                            hintText: 'Password',
                            image: 'lib/assets/paas-icon.png'),
                        SizedBox(
                          height: 10,
                        ),
                        SignTextField(
                            hintText: 'Password',
                            image: 'lib/assets/paas-icon.png'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNav()),
                        );
                      },
                      child: CustomButton(
                          buttonName: 'Sign',
                          hight: 80.h,
                          radius: 20.r,
                          width: 350.w)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("Or continue with",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white54)),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                        width: 80,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.none,
                              image: AssetImage('lib/assets/google log.png')),
                        )),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
