import 'package:alert_banner/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


message(context, String message) {
  showAlertBanner(
    context,
    () => debugPrint("TAPPED"),
    AlertBannerChild(
      text: message,
    ),
    alertBannerLocation: AlertBannerLocation.top,
  );
}

class AlertBannerChild extends StatelessWidget {
  final String text;
  const AlertBannerChild({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
      decoration: const BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Material(
          color: Colors.transparent,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

errorMessage(context, error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(error), // Display the error message here
      duration: const Duration(seconds: 3), // Adjust the duration as needed
    ),
  );
}

confirmation(
    {required String info,
    required Widget icon,
    required bool hideCancel,
    required void Function()? onPressed}) {
  EasyLoading.show(
      maskType: EasyLoadingMaskType.clear,
      indicator: SizedBox(
        height: 120,
        width: 200,
        child: Column(
          children: [
            Text(
              info,
              style:
                  const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hideCancel
                    ? InkWell(
                        onTap: onPressed,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blue,
                          child: Center(
                            child: icon,
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: onPressed,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blue,
                              child: Center(
                                child: icon,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue,
                            child: IconButton(
                                onPressed: () {
                                  EasyLoading.dismiss();
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      )
              ],
            ),
          ],
        ),
      ));
}
