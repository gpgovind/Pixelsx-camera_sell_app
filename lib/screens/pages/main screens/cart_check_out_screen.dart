import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';

import '../../../utils/const_path.dart';
import '../../../widgets/razorpay widget/razorPay_screen_widget.dart';
import '../../../widgets/widget_path.dart';
import '../settings screens/change_address.dart';

// ignore: must_be_immutable
class CartCheckOutScreen extends ConsumerWidget {
  const CartCheckOutScreen({super.key, required this.total});

  final double total;

  @override
  Widget build(BuildContext context, ref) {
    final cart = ref.watch(cartContentsProvider);
    final product = ref.watch(productListProvider);
    final userDetails = ref.watch(userCurrentDetails);
    return product.when(
        data: (productData) {
          return backgroundColor(
              child: cart.when(
                  data: (userCartData) {
                    final reference = userCartData
                        .map((cartData) => (cartData.data()
                                as Map<String, dynamic>)['productReference']
                            as DocumentReference)
                        .toList();
                    log(reference.toString());
                    return Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                        ),
                        extendBody: true,
                        backgroundColor: Colors.transparent,
                        body: userDetails.when(
                            data: (userData) {
                              final user =
                                  userData!.data() as Map<String, dynamic>;
                              log(userData.id.toString());

                              final userName = user['name'];
                              final userCity = user['city'];
                              final userAddress = user['address'];

                              return SafeArea(
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              CustomNavigator.navigationPush(
                                                  context: context,
                                                  child: const ChangeAddress());
                                            },
                                            child: Text(
                                              'change your address',
                                              style: TextStyle(
                                                  fontSize:
                                                      24.498355865478516.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.blue),
                                            )),
                                        ShadeContainer(
                                            height: 120,
                                            radius: 10,
                                            width: double.infinity,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Wrap(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Name',
                                                        style: TextStyle(
                                                            fontSize:
                                                                24.498355865478516
                                                                    .sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                customTextColor),
                                                      ),
                                                      const SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text(
                                                        ': $userName',
                                                        style: TextStyle(
                                                            fontSize: 20.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                customTextColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 40,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Address',
                                                        style: TextStyle(
                                                            fontSize:
                                                                24.498355865478516
                                                                    .sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                customTextColor),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      FittedBox(
                                                        child: Text(
                                                          ': $userAddress',
                                                          style: TextStyle(
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  customTextColor),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 40,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'city',
                                                        style: TextStyle(
                                                            fontSize:
                                                                24.498355865478516
                                                                    .sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                customTextColor),
                                                      ),
                                                      const SizedBox(
                                                        width: 50,
                                                      ),
                                                      Text(
                                                        ': $userCity',
                                                        style: TextStyle(
                                                            fontSize: 20.4.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                customTextColor),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                                height: 10,
                                              ),
                                          itemCount: userCartData.length,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          itemBuilder: (context, index) {
                                            final cartData = userCartData[index]
                                                .data() as Map<String, dynamic>;
                                            final cartReference =
                                                cartData['productReference']
                                                    as DocumentReference;
                                            // final pcount = cartData['p_count'];
                                            final id = userCartData[index].id;

                                            log(id.toString());

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
                                            final imageUrl =
                                                matchingProduct['p_image'];
                                            return GridAnimatorWidget(
                                              child: ShadeContainer(
                                                  key: UniqueKey(),
                                                  elevation: 3,
                                                  height: 130,
                                                  radius: 10,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            9.0),
                                                    child: Stack(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 100,
                                                              width: 150,
                                                              child: Wrap(
                                                                direction: Axis
                                                                    .vertical,
                                                                children: [
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  FittedBox(
                                                                    child: Text(
                                                                        productName,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                22.519121170043945.sp,
                                                                            fontWeight: FontWeight.w400,
                                                                            color: Colors.white)),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  FittedBox(
                                                                    child: Row(
                                                                      children: [
                                                                        const Text(
                                                                            "price ₹",
                                                                            style: TextStyle(
                                                                                fontSize: 17.863384246826172,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: Colors.white)),
                                                                        const SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                            productPrice,
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
                                                                  FittedBox(
                                                                    child: Row(
                                                                      children: [
                                                                        const Text(
                                                                            "Stock",
                                                                            style: TextStyle(
                                                                                fontSize: 17.863384246826172,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: Colors.white)),
                                                                        const SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                            productStock,
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
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          child: Column(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topRight,
                                                                child: CashNetworkImage(
                                                                    imageUrl:
                                                                        imageUrl),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                            );
                                          }),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        width: double.infinity,
                                        height: 200.h,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            color: Color(0xff363940)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 20),
                                          child: Stack(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text("Order Info",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("ship cost",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.red)),
                                                      Text('10',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.red))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text("Total",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.red)),
                                                      Text(total.toString(),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .red))
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 30.h,
                                                  ),
                                                  RazorPayButton(
                                                    userAddress: userAddress,
                                                    productRef: reference,
                                                    amount: total.toInt() + 10,
                                                    itemCount: 1,
                                                    productName: 'cart items',
                                                    userName: userName,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            error: (error, stackTrace) => loading(),
                            loading: loading));
                  },
                  error: (error, stackTrace) => loading(),
                  loading: loading));
        },
        error: (error, stackTrace) => loading(),
        loading: loading);
  }
}
