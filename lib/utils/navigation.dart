import 'package:page_transition/page_transition.dart';

import 'package:flutter/material.dart';

class CustomNavigator {
  static void navigationPush(
      {required BuildContext context, required Widget child}) {
    Navigator.push(
      context,
      PageTransition(
        child: child,
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 600),
        isIos: true,
      ),
    );
  }

  static void navigationPushReplace(
      {required BuildContext context, required Widget child}) {
    Navigator.pushReplacement(
      context,
      PageTransition(
        child: child,
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: 600),
        isIos: true,
      ),
    );
  }

  static void navigationPop({
    required BuildContext context,
  }) {
    Navigator.of(context).pop();
  }
}
