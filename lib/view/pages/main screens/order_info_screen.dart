import 'dart:developer';

import 'package:camera_sell_app/model/product_model.dart';
import 'package:camera_sell_app/view/pages/settings%20screens/change_address.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/const_path.dart';
import '../../../widgets/razorpay widget/razorPay_screen_widget.dart';

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
        appBar: AppBar(
          title: Text(
            'Order Info',
            style: TextStyle(color: customTextColor),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
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
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(72, 76, 87, 1),
                            borderRadius: BorderRadius.circular(18)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(widget.items.productName,
                                    style: TextStyle(
                                        fontSize: 22.519121170043945.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
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
                                          if (count >= 1) {
                                            setState(() {
                                              count++;
                                              totalAmount = totalAmount * count;
                                              log(totalAmount.toString());
                                            });
                                          }
                                        },
                                        child: customIncreaseButton()),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
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
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            CashNetworkImage(
                              imageUrl: widget.items.productImage,
                              hight: 100,
                            ),
                          ],
                        ),
                      ),
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
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(72, 76, 87, 1),
                                borderRadius: BorderRadius.circular(18)),
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
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RazorPayButton(
                            userAddress: userAddress,
                            productRef: widget.reference,
                            amount: totalAmount,
                            itemCount: count,
                            productName: widget.items.productName,
                            userName: buyerName),
                      )
                    ],
                  );
                },
                error: (error, stackTrace) => loading(),
                loading: loading)),
      ),
    ));
  }
}
