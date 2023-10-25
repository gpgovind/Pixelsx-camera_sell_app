import 'package:camera_sell_app/widgets/shade_container.dart';
import 'package:flutter/material.dart';

import '../utils/const_path.dart';
import 'delivery_selected_page.dart';

class OrderProgressMange extends StatelessWidget {
  const OrderProgressMange(
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
    return backgroundColor(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              ShadeContainer(
                radius: 18,
                elevation: 2,
                height: 180,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 1,
                        top: 5,
                        child: Text('name: $userName',
                            style: const TextStyle(
                                fontSize: 15.863384246826172,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      ),
                      Positioned(
                        left: 1,
                        top: 30,
                        child: Text('address: $userAddress',
                            style: const TextStyle(
                                fontSize: 15.863384246826172,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      ),
                      Positioned(
                        left: 1,
                        top: 55,
                        child: Text('number: $userNumber',
                            style: const TextStyle(
                                fontSize: 15.863384246826172,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      ),
                      Positioned(
                        left: 1,
                        top: 80,
                        child: Text('price: $productPrice',
                            style: const TextStyle(
                                fontSize: 15.863384246826172,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      ),
                      Positioned(
                        left: 1,
                        bottom: 32,
                        child: Text('status: $orderInfo',
                            style: TextStyle(
                                fontSize: 15.863384246826172,
                                fontWeight: FontWeight.w400,
                                color: Colors.green[300])),
                      ),
                      Positioned(
                          right: 1,
                          bottom: 10,
                          child: CashNetworkImage(imageUrl: imageUrl)),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: OrderUpdatePage(
                  docId: docId,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
