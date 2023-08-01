import 'dart:developer';
import 'package:camera_sell_app/view/pages/welcome%20screen%20and%20auth%20screen/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_nav.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        // this stream will continually listen authState
        // and it will notify user login or not
        builder: (context, snapshot) {
          // Loading state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child:
                  CircularProgressIndicator(), // Show a circular progress indicator while loading
            );
          }

          // User is logged in
          if (snapshot.hasData) {
            log('has data');
            return const BottomNav();
          }
          // User is NOT logged in
          else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
