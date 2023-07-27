import 'package:flutter/material.dart';

void errorMessage(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message),backgroundColor: Colors.red,),
  );
}