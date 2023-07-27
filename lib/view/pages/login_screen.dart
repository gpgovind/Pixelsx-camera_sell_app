import 'package:camera_sell_app/services/login.dart';
import 'package:camera_sell_app/utils/background_image.dart';
import 'package:camera_sell_app/view/pages/widgets/login_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../services/google_auth.dart';
import 'widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundImage(
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(1.0),
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
                                const Text("Login to your account",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white)),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        LoginTextField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: emailController,
                                          image: "lib/assets/mail-icon2.png",
                                          hintText: 'Email',
                                          height: 25,
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        LoginTextField(
                                          keyboardType: TextInputType.text,
                                          controller: passwordController,
                                          obscureText: true,
                                          image: "lib/assets/paas-icon.png",
                                          hintText: 'Password',
                                          height: 25.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 53).r,
                                  child: Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text("Forget Password?",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white))),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      await logUserIn(
                                          context: context,
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                  child: CustomButton(
                                      buttonName: 'Login',
                                      hight: 80.h,
                                      radius: 20.r,
                                      width: 350.w),
                                ),
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
                                  onTap: () async {
                                    await AuthService()
                                        .signInWithGoogle(context);
                                  },
                                  child: Container(
                                      width: 80,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                            fit: BoxFit.none,
                                            image: AssetImage(
                                                'lib/assets/google log.png')),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ))))));
  }
}
