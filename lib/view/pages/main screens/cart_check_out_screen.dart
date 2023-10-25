import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';

import '../../../utils/const_path.dart';
import '../../../widgets/razorpay widget/razorPay_screen_widget.dart';
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
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 15),
                                          margin: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              color:
                                                  Color.fromRGBO(72, 76, 87, 1),
                                              borderRadius:
                                                  BorderRadius.circular(18)),
                                          child: RichText(
                                            textAlign: TextAlign.start,
                                            text: TextSpan(
                                              style: TextStyle(height: 2.5),
                                              children: [
                                                TextSpan(
                                                  text: 'Name',
                                                  style: TextStyle(
                                                    fontSize: 20.5.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: customTextColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' : $userName\n',
                                                  style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: customTextColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Address',
                                                  style: TextStyle(
                                                    fontSize: 20.5.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: customTextColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' : $userAddress\n',
                                                  style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: customTextColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'City',
                                                  style: TextStyle(
                                                    fontSize: 20.5.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: customTextColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      ' : ${userCity.toString().toLowerCase()}',
                                                  style: TextStyle(
                                                    fontSize: 18.4.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: customTextColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                                            final rating =
                                                matchingProduct['p_rate'];

                                            return GridAnimatorWidget(
                                              child: Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 15),
                                                  margin: EdgeInsets.all(8.0),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          72, 76, 87, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            ratingIcon,
                                                            width: 23.w,
                                                            height: 23.h,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            rating
                                                                .toStringAsFixed(
                                                                    1),
                                                            style: TextStyle(
                                                              fontSize: 18.3.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            productName,
                                                            style: TextStyle(
                                                              fontSize: 22.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  customTextColor,
                                                            ),
                                                          ),
                                                          Spacer(),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          RichText(
                                                            textAlign:
                                                                TextAlign.start,
                                                            text: TextSpan(
                                                              style: TextStyle(
                                                                  height: 1.9),
                                                              children: [
                                                                TextSpan(
                                                                  text: 'price  :',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        20.5.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        customTextColor,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      ' ₹ $productPrice\n',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        Colors.red[400],
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: 'Stock',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        20.5.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        customTextColor,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      ' : $productStock',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18.4.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        customTextColor,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          CashNetworkImage(
                                                            imageUrl: imageUrl,
                                                            hight: 70,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          }),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            color: Color(0xff363940)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
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
                                                      Text('₹ 10',
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
                                                      Text('₹ ${total.toString()}',
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
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: RazorPayButton(
                                                      userAddress: userAddress,
                                                      productRef: reference,
                                                      amount:
                                                          total.toInt() + 10,
                                                      itemCount: 1,
                                                      productName: 'cart items',
                                                      userName: userName,
                                                    ),
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
