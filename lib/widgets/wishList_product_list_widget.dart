import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/product_model.dart';
import '../view/pages/main screens/order_info_screen.dart';
import '../utils/const_path.dart';
import 'widget_path.dart';

class WishListProductList extends StatelessWidget {
  const WishListProductList({
    super.key,
    required this.imageUrl,
    required this.productDescription,
    required this.productName,
    required this.productPrice,
    required this.productStock,
    required this.reference,
    required this.id,
  });

  final String productName;
  final String productPrice;
  final String productStock;
  final DocumentReference reference;
  final String productDescription;
  final String imageUrl;
  final String id;

  @override
  Widget build(
    BuildContext context,
  ) {
    return ShadeContainer(
        elevation: 3,
        height: 200,
        radius: 25,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        FittedBox(
                          child: Text(productName,
                              style: TextStyle(
                                  fontSize: 22.519121170043945.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              const Text("price ₹",
                                  style: TextStyle(
                                      fontSize: 17.863384246826172,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(productPrice,
                                  style: TextStyle(
                                      fontSize: 17.863384246826172,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red[300])),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              const Text("Stock",
                                  style: TextStyle(
                                      fontSize: 17.863384246826172,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(productStock,
                                  style: TextStyle(
                                      fontSize: 17.863384246826172,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red[300])),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        CustomNavigator.navigationPush(
                            context: context,
                            child: OrderInfoScreen(
                              reference: reference,
                              items: Product(
                                  price: productPrice,
                                  productStock: productStock,
                                  productName: productName,
                                  productDescription: productDescription,
                                  productImage: imageUrl),
                            ));
                      },
                      child: const CustomButton(
                          buttonName: 'buy', hight: 50, radius: 10, width: 150),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final product = ref.watch(productProvider);
                        return InkWell(
                          onTap: () {
                            product.addToCart(id);
                          },
                          child: const CustomButton(
                              buttonName: 'cart',
                              hight: 50,
                              radius: 10,
                              width: 150),
                        );
                      },
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: CashNetworkImage(imageUrl: imageUrl),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
