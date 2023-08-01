import 'package:flutter/material.dart';


final Container customCheckOutButton = Container(
padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(18), // Add border radius
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(153, 153, 153, 1),
        Color.fromRGBO(107, 113, 129, 1)
      ],
    ),
  ),
  child: const Center(
      child: Text("proceed to check out",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white))),
);
