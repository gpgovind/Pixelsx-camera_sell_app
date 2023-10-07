import 'dart:developer';

import 'package:camera_sell_app/utils/const_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';

import '../../../widgets/widget_path.dart';

class OrderDetailsScreen extends ConsumerWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(userOrderList);
    final product = ref.watch(productListProvider);
    final userDetails = ref.watch(userCurrentDetails);
    return SafeArea(
        child: userDetails.when(
            data: (userData) {
              final user = userData!.data() as Map<String, dynamic>;
              log(userData.id.toString());
              final userAddress = user['address'];
              final userName = user['name'];
              final phoneNumber = user['phoneNumber'];
              return backgroundColor(
                child: product.when(
                    data: (productData) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text(
                            'order Info',
                            style: TextStyle(color: customTextColor),
                          ),
                          backgroundColor: customAppBarColor,
                          centerTitle: true,
                          foregroundColor: Colors.white,
                        ),
                        backgroundColor: Colors.transparent,
                        body: order.when(
                            data: (data) {
                              return data.isEmpty?showGif() :ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 5,
                                ),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final orderData = data[index].data()
                                      as Map<String, dynamic>;
                                  final orderReference =
                                      orderData['productReference']
                                          as DocumentReference;
                                  final orderInfo = orderData['p_order'];
                                  // final isDelved =
                                  //     orderData['p_Delivered'] as bool;

                                  // Find the corresponding product in productData

                                  final matchingProduct =
                                      productData.firstWhere(
                                    (product) =>
                                        product.reference == orderReference,
                                  );

                                  final productPrice =
                                      matchingProduct['p_price'];
                                  final productName = matchingProduct['p_name'];
                                  final productDescription =
                                      matchingProduct['p_description'];
                                  final imageUrl = matchingProduct['p_image'];
                                  final docId = matchingProduct.reference;
                                  final pId = matchingProduct.id;
                                  final  currentRating =
                                      matchingProduct['p_rate'];

                              
                                

                                  log(docId.toString());
                                  return GridAnimatorWidget(
                                    child: ShowOrderList(
                                      isDelved: true,
                                      userAddress: userAddress,
                                      userName: userName,
                                      userNumber: phoneNumber,
                                      imageUrl: imageUrl,
                                      orderInfo: orderInfo,
                                      productName: productName,
                                      productPrice: productPrice,
                                      productDescription: productDescription,
                                      currentRating: currentRating,
                                      pId: pId,
                                    ),
                                  );
                                },
                              );
                            },
                            error: (error, stackTrace) => loading(),
                            loading: loading),
                      );
                    },
                    error: (error, stackTrace) => loading(),
                    loading: loading),
              );
            },
            error: (error, stackTrace) => loading(),
            loading: loading));
  }
  
  Widget showGif() {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100,
        child: Column(
          children: [
            Image.asset(
              noOrderData,
            ),
            const Text('purchase please..',
                style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
