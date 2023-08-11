import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/widget_path.dart';
import 'welcome_screen.dart';

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
