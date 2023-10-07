import 'dart:developer';

import 'package:camera_sell_app/data/product_model.dart';
import 'package:camera_sell_app/screens/pages/settings%20screens/change_address.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/const_path.dart';
import '../../../widgets/razorpay widget/razorPay_screen_widget.dart';
import '../../../widgets/widget_path.dart';

class OrderInfoScreen extends ConsumerStatefulWidget {
  const OrderInfoScreen({
    super.key,
    required this.items,
    required this.reference,
  });
  final Product items;
  final DocumentReference reference;

  @override
  ConsumerState<OrderInfoScreen> createState() => _OrderInfoScreenState();
}

class _OrderInfoScreenState extends ConsumerState<OrderInfoScreen> {
  int count = 1;
  String buyerName = '';
  int amount = 1;
  int totalAmount = 0;

  @override
  void initState() {
    super.initState();
    final parsedPrice =
        int.parse(widget.items.price.toString().replaceAll(',', ''));
    amount = parsedPrice;

    totalAmount = parsedPrice;
  }

  @override
  Widget build(BuildContext context) {
    final userDetails = ref.watch(userCurrentDetails);
    return backgroundColor(
        child: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
            child: userDetails.when(
                data: (userData) {
                  final user = userData!.data() as Map<String, dynamic>;
                  log(userData.id.toString());

                  final userName = user['name'];
                  final userCity = user['city'];
                  final userAddress = user['address'];
                  buyerName = userName;
                  return Column(
                    children: [
                      ShadeContainer(
                          radius: 18,
                          height: 140,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 10,
                                right: 25,
                                child: CashNetworkImage(
                                  imageUrl: widget.items.productImage,
                                  hight: 100,
                                  width: 120,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Positioned(
                                left: 10,
                                top: 5,
                                child: Text(widget.items.productName,
                                    style: TextStyle(
                                        fontSize: 22.519121170043945.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 10,
                                child: Row(
                                  children: [
                                    Text('price : ',
                                        style: TextStyle(
                                            fontSize: 22.519121170043945.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                    Text('₹$amount',
                                        style: TextStyle(
                                            fontSize: 22.519121170043945.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.red[300])),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 50,
                                left: 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          if (count >= 1) {
                                            setState(() {
                                              count++;
                                              totalAmount = totalAmount * count;
                                              log(totalAmount.toString());
                                            });
                                          }
                                        },
                                        child: customIncreaseButton()),
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    Text(count.toString(),
                                        style: TextStyle(
                                            fontSize: 24.498355865478516.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          if (count > 1) {
                                            setState(() {
                                              count--;
                                              totalAmount = amount * count;
                                              log(totalAmount.toString());
                                            });
                                          }
                                        },
                                        child: customDegreesButton()),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 30,
                      ),
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
                                    fontSize: 24.498355865478516.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue),
                              )),
                          ShadeContainer(
                              height: 150,
                              radius: 10,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Name',
                                          style: TextStyle(
                                              fontSize: 24.498355865478516.sp,
                                              fontWeight: FontWeight.w400,
                                              color: customTextColor),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          ': $userName',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w400,
                                              color: customTextColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Address',
                                          style: TextStyle(
                                              fontSize: 24.498355865478516.sp,
                                              fontWeight: FontWeight.w400,
                                              color: customTextColor),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        FittedBox(
                                          child: Text(
                                            ': $userAddress',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w400,
                                                color: customTextColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'city',
                                          style: TextStyle(
                                              fontSize: 24.498355865478516.sp,
                                              fontWeight: FontWeight.w400,
                                              color: customTextColor),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          ': ${userCity.toString().toLowerCase()}',
                                          style: TextStyle(
                                              fontSize: 20.4.sp,
                                              fontWeight: FontWeight.w400,
                                              color: customTextColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      RazorPayButton(
                          userAddress: userAddress,
                          productRef: widget.reference,
                          amount: totalAmount,
                          itemCount: count,
                          productName: widget.items.productName,
                          userName: buyerName)
                    ],
                  );
                },
                error: (error, stackTrace) => loading(),
                loading: loading)),
      ),
    ));
  }
}
