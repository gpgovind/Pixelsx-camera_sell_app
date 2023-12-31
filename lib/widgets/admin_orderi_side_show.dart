import 'package:camera_sell_app/utils/const_path.dart';
import 'package:flutter/material.dart';

import 'admin_order_info_widget.dart';

class ShowOrderListAdmin extends StatelessWidget {
   ShowOrderListAdmin(
      {super.key,
      required this.imageUrl,
      required this.orderInfo,
      required this.productName,
      required this.productDescription,
      required this.userAddress,
      required this.userName,
      required this.userNumber,
      required this.docId,
      required this.isDelved,
      required this.productPrice});
  final String productName;
  final String productPrice;
  final String orderInfo;
  final String imageUrl;
  final String productDescription;
  final bool isDelved;
  final String docId;

  final String userName;
  final String userAddress;
  final String userNumber;

 final bool onClicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListTile(
        textColor: Colors.white,
        trailing: Text('₹ $productPrice',
            style: TextStyle(
                fontSize: 17.863384246826172,
                fontWeight: FontWeight.w400,
                color: Colors.green[300])),
        tileColor: const Color.fromRGBO(72, 76, 87, 1),
        title: Text(productName,
            style: const TextStyle(
                fontSize: 17.863384246826172,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
        // leading: CashNetworkImage(imageUrl: widget.imageUrl),
        onTap: () {
          CustomNavigator.navigationPush(
              context: context,
              child: OrderProgressMange(
                docId: docId,
                imageUrl: imageUrl,
                isDelved: isDelved,
                orderInfo: orderInfo,
                productDescription: productDescription,
                productName: productName,
                productPrice: productPrice,
                userAddress: userAddress,
                userName: userName,
                userNumber: userNumber,
              ));
        },
      ),
    );
  }
}
