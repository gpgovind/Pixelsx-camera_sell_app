

import 'package:camera_sell_app/utils/const_path.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

succeeded(WidgetRef ref, productRef) {



  ref
      .watch(orderProvider)
      .addToOrderPage(
        productRef,
      )
      .whenComplete(() {
    EasyLoading.show(
        dismissOnTap: true,
        indicator:esLoading(),
        status: 'PayMent Succeed Thank you for your Purchase');
  });
}

cancel() => EasyLoading.showError('Payment Failed', dismissOnTap: true);
handleExternalWalletSelected() =>
    EasyLoading.showInfo('External Wallet Selected', dismissOnTap: true);
