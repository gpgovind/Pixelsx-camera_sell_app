import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void errorMessage(context, String message) {
  SnackBar snackBar = SnackBar(
    content: Center(
      child: Text(
        message,
        style:  const TextStyle(
          fontSize: 20,
        ),
      ),
    ),
    backgroundColor: Colors.indigo,
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 10).r,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

