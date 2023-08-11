import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/const_path.dart';
import '../view/pages/welcome screen and auth screen/firebase_auth_screen.dart';



class AuthService {
  Future<UserCredential?> signInWithGoogle(context) async {
    try {
      // Begin interactive sign-in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      // Obtain auth details from user
      if (gUser == null) {
        return null; // Return null if the user canceled the sign-in process
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      //f the sign-in was successful, this line obtains the authentication details for the signed-in user.

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
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
      log('FirebaseAuthException during Google sign-in: ${e.message}');

      return null; // Return null to indicate that the sign-in process was not successful.
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text("PlatformException during Google sign-in: ${e.message}")),
      );
      log('PlatformException during Google sign-in: ${e.message}');

      return null; // Return null to indicate that the sign-in process was not successful.
    } catch (error) {
      // Handle other generic errors
      log('Error during Google sign-in: $error');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error during Google sign-in: $error'")),
      );

      return null;
    }
    return null;
  }
}
