import 'package:camera_sell_app/utils/const_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

// ignore: must_be_immutable
class RazorPayButton extends ConsumerStatefulWidget {
  const RazorPayButton(
      {super.key,
      required this.amount,
      required this.itemCount,
      required this.productName,
      required this.productRef,
      required this.userAddress,
      required this.userName});
  final int amount;
  final String productName;
  final String userName;
  final int itemCount;
  final dynamic productRef;
  final String userAddress;

  @override
  ConsumerState<RazorPayButton> createState() => _RazorPayButtonState();
}

class _RazorPayButtonState extends ConsumerState<RazorPayButton> {
  @override
  Widget build(BuildContext context) {
    return neoPopBtnNew(
        color: Colors.grey[300]!,
        text: 'Buy',
        vertical: 10,
        onTapUp: () {
          if (widget.userAddress == 'empty') {
            EasyLoading.showInfo('please fill Address');
          } else {
            Razorpay razorpay = Razorpay();
            var options = {
              'key': 'rzp_test_NNbwJ9tmM0fbxj',
              'amount': widget.amount,
              'name': widget.userName,
              'description': widget.productName,
              'retry': {'enabled': true, 'max_count': widget.itemCount},
              'send_sms_hash': true,
              'prefill': {
                'contact': '8888888888',
                'email': 'test@razorpay.com'
              },
              'external': {
                'wallets': ['paytm']
              }
            };
            razorpay.on(
                Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
            razorpay.on(
                Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
            razorpay.on(
                Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
            razorpay.open(options);
          }
        });
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    EasyLoading.showError(
      'Payment Failed Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}',
      dismissOnTap: true,
    );
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    await ref.watch(orderProvider).addToOrderPage(widget.productRef);
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    EasyLoading.showInfo(
      'External Wallet Selected ${response.walletName}',
      dismissOnTap: true,
    );
  }
}
