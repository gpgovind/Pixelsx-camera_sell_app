import 'package:camera_sell_app/utils/const_path.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // instance fof  WelcomeScreenBloc

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: backgroundColor(
        child: SafeArea(
            child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 100,
                    child: Image.asset(appLog),
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
      ),
    );
  }
}
