import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/navigation.dart';
import '../utils/toast_message.dart';
import '../view/pages/welcome screen and auth screen/firebase_auth_screen.dart';

Future<void> logUserIn({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    String? userEmail = userCredential.user?.email;
    if (userEmail != null) {
      log('User signed in successfully. Email: $userEmail');
    } else {
      log('User signed in successfully, but the user email is null.');
    }

    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    ).then((value) => CustomNavigator.navigationPushReplace(
        context: context, child: const AuthPage()));

    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.of(context, rootNavigator: true).pop();
  } on FirebaseAuthException catch (e) {
    // Handle FirebaseAuthException errors
    if (e.code == 'user-not-found') {
      errorMessage(context, 'User not found. Please register an account.');
    } else if (e.code == 'wrong-password') {
      // Utils().toastMessage('Incorrect password. Please try again.');
      errorMessage(context, 'Incorrect password. Please try again.');
    } else if (e.code == 'invalid-email') {
      errorMessage(
          context, 'Invalid email format. Please check your email address.');
    } else if (e.code == 'user-disabled') {
      errorMessage(
          context, 'User account is disabled. Please contact support.');
    } else {
      // Handle other FirebaseAuthException errors

      errorMessage(context, 'Sign-in error');
    }
  } catch (error) {
    // Handle other generic errors

    errorMessage(context, 'Error signing in');
  }
}

void signUserOut(BuildContext context) {
  FirebaseAuth.instance.signOut().then((_) {
    log('signOut');

    // Navigate to the login screen and remove all previous routes
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (build) => const AuthPage()),
        (route) => false);
  }).catchError((error) {
    // Handle any sign-out errors here
    log('Error signing out: $error');
  });
}
