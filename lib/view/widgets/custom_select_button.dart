import 'package:flutter/material.dart';

GestureDetector customSelectButton({void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 181,
      height: 39,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xff00b2ff)),
      child: const Center(
        child: Text("SELECT",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
      ),
    ),
  );
}
