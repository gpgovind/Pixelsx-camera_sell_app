import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/navigation.dart';
import '../utils/toast_message.dart';
import '../view/pages/welcome screen and auth screen/firebase_auth_screen.dart';

Future<void> signInUser(
    {required BuildContext context,
    required String email,
    required String password}) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    String? userEmail = userCredential.user!.email;
    log('User signed in successfully. Email: $userEmail');

    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    ).then((value) =>  CustomNavigator.navigationPushReplace(context: context, child: const AuthPage()));

    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.of(context, rootNavigator: true).pop();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'firebase_auth/invalid-email') {
      // Handle invalid email format error

      errorMessage(
          context, 'Invalid email format. Please check your email address.');
    } else if (e.code == 'firebase_auth/user-not-found') {
      // Handle user not found error
      errorMessage(context, 'User not found. Please register an account');
    } else if (e.code == 'firebase_auth/wrong-password') {
      // Handle wrong password error

      errorMessage(context, 'Incorrect password. Please try again');
    } else {
      // Handle other FirebaseAuthException errors

      errorMessage(context, 'Sign-in error');
    }
  } catch (error) {
    // Handle other generic errors

    errorMessage(context, 'Error signing in');
  }
}
