import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../screens/pages/auth screens/firebase_auth_screen.dart';
import '../../utils/const_path.dart';

class Authentication {
  Stream<User?> get authStateChange => auth.authStateChanges();

  Future signInUser(
      {
      required BuildContext context,
      required String name,
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

    } on FirebaseAuthException catch (e) {
      if (e.code == 'firebase_auth/invalid-email') {
        // Handle invalid email format error

        message(
            context, 'Invalid email format. Please check your email address.');
      } else if (e.code == 'firebase_auth/user-not-found') {
        // Handle user not found error
        message(context, 'User not found. Please register an account');
      } else if (e.code == 'firebase_auth/wrong-password') {
        // Handle wrong password error

        message(context, 'Incorrect password. Please try again');
      } else {
        // Handle other FirebaseAuthException errors

        message(context, 'Sign-in error');
      }
    } catch (error) {
      // Handle other generic errors

      message(context, 'Error signing in');
    }
  }
  //------------------------------------//

  void handleForgetPassword({required String email, context}) async {
    // Assuming you already initialized FirebaseApp
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      // Prompt the user to enter their email address
      String emailAddress = email; // Replace this with the user's email

      // Send a password reset email to the user
      await auth.sendPasswordResetEmail(email: emailAddress);

      // Display a success message to the user
      log("Password reset email sent to $emailAddress");
      // You can also show a snackbar or a toast message here to inform the user.
      message(context, 'Password reset email sent to $emailAddress');
    } catch (e) {
      // Handle any errors that occur during the password reset process
      log("Error sending password reset email: $e");
      message(context, 'Error sending password reset email');

      // You can show an error message to the user here.
    }
  }

  //---------------------//
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
      }
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException errors
      if (e.code == 'user-not-found') {
        message(context, 'User not found. Please register an account.');
      } else if (e.code == 'wrong-password') {
        // Utils().toastMessage('Incorrect password. Please try again.');
        message(context, 'Incorrect password. Please try again.');
      } else if (e.code == 'invalid-email') {
        message(
            context, 'Invalid email format. Please check your email address.');
      } else if (e.code == 'user-disabled') {
        message(context, 'User account is disabled. Please contact support.');
      } else {
        // Handle other FirebaseAuthException errors

        message(context, 'Sign-in error');
      }
    } catch (error) {
      // Handle other generic errors

      message(context, 'Error signing in');
    }
  }
  //------------------------//

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

  //-----------------------------------//
  Future<UserCredential?> signInWithGoogle(context, WidgetRef ref) async {
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

      await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
         ref
            .watch(userProvider)
            .storeUserData(name: gUser.displayName, email: gUser.email);
      });
    

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
