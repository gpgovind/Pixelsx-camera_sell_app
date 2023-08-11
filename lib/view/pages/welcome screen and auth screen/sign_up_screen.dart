import 'package:camera_sell_app/services/google_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../services/cloud_store.dart';
import '../../widgets/widget_path.dart';
import 'firebase_auth_screen.dart';
import '../../../services/sign_in.dart';
import '../../../utils/const_path.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                              image: 'lib/assets/user icon.png'),
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
                              image: 'lib/assets/mail-icon2.png'),
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
                              image: 'lib/assets/paas-icon.png'),
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
                              hintText: 'confirm Password',
                              image: 'lib/assets/paas-icon.png'),
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
                            await signInUser(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context)
                                .then((value) {
                              return  storeUserData(
                                  email: emailController.text,
                                  name: nameController.text,
                                  password: passwordController.text);
                            }).then((value) {
                              CustomNavigator.navigationPushReplace(
                                  context: context, child: const AuthPage());
                            });
                          } else {
                            errorMessage(context, 'password incorrect');
                          }
                        }
                      },
                      child: CustomButton(
                          buttonName: 'Sign Up',
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
                    onTap: () async {
                      await AuthService().signInWithGoogle(context).then(
                          (value) => {
                                CustomNavigator.navigationPushReplace(
                                    context: context, child: const AuthPage())
                              });
                    },
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
