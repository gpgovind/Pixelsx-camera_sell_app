import 'package:camera_sell_app/controller/provider/product_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/product_model.dart';
import '../../../utils/const_path.dart';
import '../../../widgets/widget_path.dart';
import 'order_info_screen.dart';

class CartProductListScreen extends ConsumerWidget {
  const CartProductListScreen(
      {super.key,
      required this.docId,
      required this.id,
      required this.imageUrl,
      required this.productDescription,
      required this.productName,
      required this.productPrice,
      required this.productStock,
      required this.countPId,
      required this.pcount});
  final String productPrice;
  final String productName;
  final String productStock;
  final String productDescription;
  final String imageUrl;
  final DocumentReference docId;
  final dynamic pcount;
  final String id;
  final String countPId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculation = ref.watch(productProvider);
    final product = ref.watch(productProvider);
    return ShadeContainer(
        key: UniqueKey(),
        elevation: 3,
        height: 200,
        radius: 25,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Stack(
            children: [
              showItems(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        CustomNavigator.navigationPush(
                            context: context,
                            child: OrderInfoScreen(
                              reference: docId,
                              items: Product(
                                  price: productPrice,
                                  productStock: productStock,
                                  productName: productName,
                                  productDescription: productDescription,
                                  productImage: imageUrl),
                            ));
                      },
                      child: const CustomButton(
                          buttonName: 'buy', hight: 50, radius: 18, width: 120),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        product.addToWishList(id);
                      },
                      child: const CustomButton(
                          buttonName: 'WishList',
                          hight: 50,
                          radius: 18,
                          width: 120),
                    )
                  ],
                ),
              ),
              mangeItemCount(calculation)
            ],
          ),
        ));
  }

  Align mangeItemCount(ProductProvider calculation) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CashNetworkImage(imageUrl: imageUrl),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () async {
                    if (pcount > 1) {
                      await calculation.updateCount(countPId, pcount - 1);
                    }
                  },
                  child: customDegreesButton()),
              SizedBox(
                width: 10.h,
              ),
              Text(pcount.toString(),
                  style: TextStyle(
                      fontSize: 24.498355865478516.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                  onTap: () async {
                    await calculation.updateCount(countPId, pcount + 1);
                  },
                  child: customIncreaseButton()),
            ],
          ),
        ],
      ),
    );
  }

  Column showItems() {
    return Column(
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
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
