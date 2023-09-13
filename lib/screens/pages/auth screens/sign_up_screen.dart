import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/widget_path.dart';

import '../../../utils/const_path.dart';
import 'firebase_auth_screen.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool googleLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authenticationProvider);

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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              controller: nameController,
                              hintText: 'name',
                              image: userIcon),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              hintText: 'Email',
                              image: emailIcon),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              controller: passwordController,
                              hintText: 'Password',
                              image: passwordIcon),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              controller: confirmPasswordController,
                              hintText: 'confirm',
                              image: passwordIcon),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          if (passwordController.text ==
                              confirmPasswordController.text) {
                            if (isLoading) return;
                            setState(() => isLoading = true);
                            await Future.delayed(const Duration(seconds: 5));

                            // ignore: use_build_context_synchronously
                            auth
                                .signInUser(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context)
                                .whenComplete(() {
                              () => auth.authStateChange
                                  .listen((event) => print('succuss'));
                              ref.watch(userProvider).storeUserData(
                                  name: nameController.text,
                                  email: emailController.text);
                              setState(() => isLoading = false);
                              log('completed');
                              CustomNavigator.navigationPushReplace(
                                  context: context, child: const AuthPage());
                            });
                          } else {
                            message(context, 'password incorrect');
                          }
                        }
                      },
                      child: CustomButton(
                          buttonName: 'Sign Up',
                          loading: isLoading,
                          hight: 90.h,
                          radius: 20.r,
                          width: 400.w)),
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
                      await Future.delayed(const Duration(seconds: 5));
                      // ignore: use_build_context_synchronously
                      auth.signInWithGoogle(context, ref).whenComplete(() {
                        setState(() => googleLoading = false);
                        log('completed');
                        () => auth.authStateChange
                            .listen((event) => print('succuss'));
                        CustomNavigator.navigationPushReplace(
                            context: context, child: const AuthPage());
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
          ),
        )),
      ),
    );
  }
}
