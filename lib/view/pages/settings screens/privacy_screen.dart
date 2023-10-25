import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/const_path.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return backgroundColor(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                'privacy',
                style: TextStyle(color: customTextColor),
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              foregroundColor: Colors.white,
            ),
            body: Center(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "To learn more ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                TextSpan(
                    text: "Click here",
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        var url =
                            "https://github.com/gpgovind/pixelsx-e-commerce.git";
                        // ignore: deprecated_member_use
                        if (await canLaunch(url)) {
                          // ignore: deprecated_member_use
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
              ])),
            )));
  }
}
