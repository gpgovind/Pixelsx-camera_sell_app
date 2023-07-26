

import 'dart:developer';

import 'package:camera_sell_app/view/pages/widgets/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future logUserIn({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  try {
    
    
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // User successfully logged in.
    // ignore: use_build_context_synchronously
    return Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) =>
            const BottomNav())); // Replace with the correct route to your home screen.
  } on FirebaseAuthException catch (e) {
    //  Show an error message to the user or log
    // (e.code == 'user-not-found') ? : ;
    if (e.code == 'user-not-found') {
      wrongEmail(context);
    } else if (e.code == 'wrong-password') {
      wrongPassword(context);
    }
  }
}

 singUserOut() async {
  await FirebaseAuth.instance.signOut();
  log('siOut');
}

void wrongEmail(context) {
  showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
      });
}

void wrongPassword(context) {
  showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      });
}
