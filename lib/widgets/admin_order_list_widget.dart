import 'dart:developer';

import 'package:camera_sell_app/utils/const_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'admin_orderi_side_show.dart';

class AdminOrderListWidget extends ConsumerStatefulWidget {
  const AdminOrderListWidget({super.key, required this.userEmail});
  final String userEmail;

  @override
  ConsumerState<AdminOrderListWidget> createState() =>
      _AdminOrderListWidgetState();
}

class _AdminOrderListWidgetState extends ConsumerState<AdminOrderListWidget> {
  late StreamProvider<List<DocumentSnapshot<Object?>>> userOrder;

  @override
  void initState() {
    super.initState();

    userOrder = StreamProvider<List<DocumentSnapshot<Object?>>>((ref) {
      final orderReference = FirebaseFirestore.instance
          .collection('checkOut')
          .doc(widget.userEmail);
      final cartItemsReference = orderReference.collection('orderItems');

      return cartItemsReference.snapshots().map((querySnapshot) {
        return querySnapshot.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final order = ref.watch(userOrder);
    final product = ref.watch(productListProvider);
    final userDetails = ref.watch(userCurrentDetails);

    return product.when(
        data: (productData) {
          return backgroundColor(
              child: userDetails.when(
                  data: (userData) {
                    final user = userData!.data() as Map<String, dynamic>;
                    log(userData.id.toString());
                    final userAddress = user['address'];
                    final userName = user['name'];
                    final phoneNumber = user['phoneNumber'];
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: order.when(
                          data: (userOrderList) {
                            return ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 5,
                              ),
                              itemCount: userOrderList.length,
                              itemBuilder: (context, index) {
                                final orderData = userOrderList[index].data()
                                    as Map<String, dynamic>;
                                final orderReference =
                                    orderData['productReference']
                                        as DocumentReference;
                                final orderInfo = orderData['p_order'];
                                // final isDelved =
                                //     orderData['p_Delivered'] as bool;
                                final docId = userOrderList[index].id;

                                // Find the corresponding product in productData

                                final matchingProduct = productData.firstWhere(
                                  (product) =>
                                      product.reference == orderReference,
                                );

                                final productPrice = matchingProduct['p_price'];
                                final productName = matchingProduct['p_name'];
                                // final productStock = matchingProduct['p_stock'];
                                final productDescription =
                                    matchingProduct['p_description'];
                                final imageUrl = matchingProduct['p_image'];

                                // final docId = matchingProduct.reference;

                                return ShowOrderListAdmin(
                                  docId: docId,
                                  imageUrl: imageUrl,
                                  orderInfo: orderInfo,
                                  isDelved: true,
                                  productDescription: productDescription,
                                  productName: productName,
                                  productPrice: productPrice,
                                  userAddress: userAddress,
                                  userName: userName,
                                  userNumber: phoneNumber,
                                );
                              },
                            );
                          },
                          error: (error, stackTrace) => loading(),
                          loading: loading),
                    );
                  },
                  error: (error, stackTrace) => loading(),
                  loading: loading));
        },
        error: (error, stackTrace) => loading(),
        loading: loading);
  }
}
