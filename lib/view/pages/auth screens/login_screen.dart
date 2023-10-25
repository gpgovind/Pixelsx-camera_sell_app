import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/const_path.dart';
import '../../../widgets/widget_path.dart';
import 'firebase_auth_screen.dart';
import 'forget_pass_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool googleLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authenticationProvider);

    return Scaffold(
        body: BackgroundImage(
            child: SafeArea(
                child: Container(
                    margin: EdgeInsets.only(top: 60.sp),
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
                                    CustomTextField(
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter email';
                                        }
                                        return null;
                                      },
                                      controller: emailController,
                                      image: emailIcon,
                                      hintText: 'Email',
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    CustomTextField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter password';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.text,
                                      controller: passwordController,
                                      obscureText: true,
                                      image: passwordIcon,
                                      hintText: 'Password',
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
                                      onPressed: () async {
                                        CustomNavigator.navigationPush(
                                            context: context,
                                            child: const ForgetPassScreen());
                                      },
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
                                  if (isLoading) return;
                                  setState(() => isLoading = true);
                                  await Future.delayed(
                                      const Duration(seconds: 5));
                                  // ignore: use_build_context_synchronously
                                  auth
                                      .logUserIn(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          context: context)
                                      .whenComplete(() {
                                    () => auth.authStateChange
                                        .listen((event) => print('succuss'));
                                    setState(() => isLoading = false);

                                    log('completed');

                                    CustomNavigator.navigationPushReplace(
                                        context: context,
                                        child: const AuthPage());
                                  });
                                }
                              },
                              child: CustomButton(
                                  buttonName: 'Login',
                                  loading: isLoading,
                                  hight: 90.h,
                                  radius: 20.r,
                                  width: 400.w),
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
                                if (googleLoading) return;
                                setState(() => googleLoading = true);
                                await Future.delayed(
                                    const Duration(seconds: 5));
                                // ignore: use_build_context_synchronously
                                auth
                                    .signInWithGoogle(context, ref)
                                    .whenComplete(() {
                                  () => auth.authStateChange
                                      .listen((event) => print('succuss'));
                                  setState(() => googleLoading = false);

                                  log('completed');
                                  CustomNavigator.navigationPushReplace(
                                      context: context,
                                      child: const AuthPage());
                                });
                              },
                              child: CircleAvatar(
                                  radius: 25.r,
                                  backgroundColor: Colors.transparent,
                                  child: googleLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : ClipOval(
                                          child: Image.asset(
                                            googleLog,
                                            fit: BoxFit.cover,
                                            height: 135.r,
                                            width: 135.r,
                                          ),
                                        )),
                            )
                          ],
                        ),
                      ),
                    )))));
  }
}
