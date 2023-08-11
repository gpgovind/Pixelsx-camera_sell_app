import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/const_path.dart';

void handleForgetPassword({required String email,context}) async {
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
    errorMessage(context, 'Password reset email sent to $emailAddress');
  } catch (e) {
    // Handle any errors that occur during the password reset process
    log("Error sending password reset email: $e");
     errorMessage(context, 'Error sending password reset email');

    // You can show an error message to the user here.
  }
}
