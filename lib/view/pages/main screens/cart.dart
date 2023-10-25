import 'dart:developer';

import 'package:camera_sell_app/view/pages/main%20screens/cart_onclick.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';
import '../../../utils/const_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cart_check_out_screen.dart';
import 'cart_product_list_screen.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({super.key});

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  double calculateTotalPrice({
    required List<DocumentSnapshot<Object?>> userCartData,
    required List<DocumentSnapshot<Object?>> productData,
  }) {
    double totalPrice = 0;

    for (final cartData in userCartData) {
      final cartDataMap = cartData.data() as Map<String, dynamic>;
      final productReference =
          cartDataMap['productReference'] as DocumentReference;

      final itemCount = cartDataMap['p_count'] as int;

      // Find the corresponding product in productData
      final matchingProduct = productData.firstWhere(
        (product) => product.reference == productReference,
      );

      final productPrice = matchingProduct['p_price'];
      final parsedPrice =
          double.parse(productPrice.toString().replaceAll(',', ''));
      totalPrice += (parsedPrice * itemCount);
    }

    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartContentsProvider);
    final product = ref.watch(productListProvider);
    final userCartDelete = ref.watch(userProvider);

    return product.when(
        data: (productData) {
          return backgroundColor(
              child: cart.when(
                  data: (userCartData) {
                    return Scaffold(
                        extendBody: true,
                        backgroundColor: Colors.transparent,
                        body: SafeArea(
                            child: userCartData.isEmpty
                                ? showGif()
                                : Column(
                                    children: [
                                      Expanded(
                                        child: ListView.separated(
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                            itemCount: userCartData.length,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            itemBuilder: (context, index) {
                                              final cartData =
                                                  userCartData[index].data()
                                                      as Map<String, dynamic>;
                                              final cartReference =
                                                  cartData['productReference']
                                                      as DocumentReference;
                                              final pcount =
                                                  cartData['p_count'];

                                              // Find the corresponding product in productData

                                              final matchingProduct =
                                                  productData.firstWhere(
                                                (product) =>
                                                    product.reference ==
                                                    cartReference,
                                              );

                                              final productPrice =
                                                  matchingProduct['p_price'];
                                              final productName =
                                                  matchingProduct['p_name'];
                                              final productStock =
                                                  matchingProduct['p_stock'];
                                              final productDescription =
                                                  matchingProduct[
                                                      'p_description'];
                                              final imageUrl =
                                                  matchingProduct['p_image'];

                                              final docId =
                                                  matchingProduct.reference;
                                              final id = matchingProduct.id;
                                              final countPid =
                                                  userCartData[index].id;

                                              log(docId.toString());

                                              return GestureDetector(
                                                onTap: () {
                                                  CustomNavigator
                                                      .navigationPush(
                                                    context: context,
                                                    child: CartOnClick(
                                                        productStock:
                                                            productStock,
                                                        imageUrl: imageUrl,
                                                        productName:
                                                            productName,
                                                        productPrice:
                                                            productPrice,
                                                        productRating: '',
                                                        productDescription:
                                                            productDescription),
                                                  );
                                                },
                                                child: GridAnimatorWidget(
                                                  child: Dismissible(
                                                    direction: DismissDirection
                                                        .endToStart,
                                                    key: Key('delete'),
                                                    onDismissed:
                                                        (direction) async {
                                                      await userCartDelete
                                                          .deleteCartItem(
                                                              countPid);
                                                    },
                                                    background: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25)),
                                                    ),
                                                    child:
                                                        CartProductListScreen(
                                                      countPId: countPid,
                                                      docId: docId,
                                                      id: id,
                                                      imageUrl: imageUrl,
                                                      pcount: pcount,
                                                      productDescription:
                                                          productDescription,
                                                      productPrice:
                                                          productPrice,
                                                      productName: productName,
                                                      productStock:
                                                          productStock,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                      orderInfo(
                                          userCartData, productData, context),
                                    ],
                                  )));
                  },
                  error: (error, stackTrace) => loading(),
                  loading: loading));
        },
        error: (error, stackTrace) => loading(),
        loading: loading);
  }

  Padding orderInfo(List<DocumentSnapshot<Object?>> userCartData,
      List<DocumentSnapshot<Object?>> productData, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Color(0xff363940)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Order Info",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.red)),
                      Text(
                          '₹ ${calculateTotalPrice(userCartData: userCartData, productData: productData).toString()}',
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.red))
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  (userCartData.isNotEmpty)
                      ? InkWell(
                          onTap: () {
                            CustomNavigator.navigationPush(
                                context: context,
                                child: CartCheckOutScreen(
                                  total: calculateTotalPrice(
                                      userCartData: userCartData,
                                      productData: productData),
                                ));
                          },
                          child: customCheckOutButton)
                      : const SizedBox(
                          width: 50,
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showGif() {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100,
        child: Column(
          children: [
            Image.asset(
              cartEmptyGif,
            ),
            const Text('Add product please',
                style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
