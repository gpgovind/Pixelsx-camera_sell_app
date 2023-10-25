import 'package:camera_sell_app/utils/const_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';

import '../../../model/product_model.dart';
import '../../../widgets/widget_path.dart';
import 'cart_onclick.dart';

class WishList extends ConsumerStatefulWidget {
  const WishList({super.key});

  @override
  ConsumerState<WishList> createState() => _CartState();
}

class _CartState extends ConsumerState<WishList> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    final wishList = ref.watch(userWishListProvider);
    final product = ref.watch(productListProvider);
    final userWishListDelete = ref.watch(userProvider);
    return backgroundColor(
        child: product.when(
            data: (productData) {
              return Scaffold(
                  appBar: AppBar(
                    backgroundColor: customAppBarColor,
                    centerTitle: true,
                    foregroundColor: Colors.white,
                    title: Text(
                      'wishList',
                      style: TextStyle(color: customTextColor, fontSize: 22),
                    ),
                  ),
                  extendBody: true,
                  backgroundColor: Colors.transparent,
                  body: wishList.when(
                      data: (userWishListData) {
                        return SafeArea(
                            child: userWishListData.isEmpty
                                ? showGif()
                                : ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 10,
                                        ),
                                    itemCount: userWishListData.length,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    itemBuilder: (context, index) {
                                      final wishListData =
                                          userWishListData[index].data()
                                              as Map<String, dynamic>;
                                      final wishListReference =
                                          wishListData['productReference']
                                              as DocumentReference;
                                      final doId = userWishListData[index].id;

                                      final matchingProduct =
                                          productData.firstWhere(
                                        (product) =>
                                            product.reference ==
                                            wishListReference,
                                      );
                                      final productDataList =
                                          getProductData(matchingProduct);

                                      final reference = wishListReference;

                                      return GestureDetector(
                                        onTap: () {
                                          CustomNavigator.navigationPush(
                                            context: context,
                                            child: CartOnClick(
                                                productStock:
                                                    productDataList['p_stock'],
                                                imageUrl:
                                                    productDataList['p_image'],
                                                productName:
                                                    productDataList['p_name'],
                                                productPrice:
                                                    productDataList['p_price'],
                                                productRating:
                                                    productDataList['p_rate']
                                                        .toString(),
                                                productDescription:
                                                    productDataList[
                                                        'p_description']),
                                          );
                                        },
                                        child: GridAnimatorWidget(
                                          child: Dismissible(
                                            key: UniqueKey(),
                                            direction:
                                                DismissDirection.endToStart,
                                            onDismissed: (direction) async {
                                              await userWishListDelete
                                                  .deleteWishListItems(doId);
                                            },
                                            background: Container(
                                            
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                            ),
                                            child: WishListProductList(
                                              id: productDataList['doc_id'],
                                              imageUrl:
                                                  productDataList['p_image'],
                                              productDescription:
                                                  productDataList[
                                                      'p_description'],
                                              productName:
                                                  productDataList['p_name'],
                                              productPrice:
                                                  productDataList['p_price'],
                                              productStock:
                                                  productDataList['p_stock'],
                                              reference: reference,
                                            ),
                                          ),
                                        ),
                                      );
                                    }));
                      },
                      error: (error, stackTrace) => loading(),
                      loading: loading));
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
              wishListEmptyGif,
            ),
            const Text('Add product please',
                style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
