import 'dart:developer';

import 'package:camera_sell_app/screens/pages/main%20screens/item_on_click.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/const_path.dart';
import '../../../widgets/widget_path.dart';

class CategoryProductList extends ConsumerStatefulWidget {
  final String category;
  final String docId;
  const CategoryProductList(
      {super.key, required this.category, required this.docId});

  @override
  ConsumerState<CategoryProductList> createState() =>
      _CategoryProductListState();
}

class _CategoryProductListState extends ConsumerState<CategoryProductList> {
  @override
  Widget build(BuildContext context) {
    final productListAsyncValue = ref.watch(productListProvider);

    return SafeArea(
      child: Scaffold(
        body: backgroundColor(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(color: Colors.white),
                title: Text(
                  widget.category,
                  style: TextStyle(
                    fontSize: 25.311471939086914.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
              productListAsyncValue.when(
                data: (productList) {
                  final filteredProducts = productList
                      .where((product) =>
                          (product.data()
                              as Map<String, dynamic>)['p_categoryId'] ==
                          widget.docId)
                      .toList();

                  if (filteredProducts.isEmpty) {
                    return Center(
                      child: Text(
                        "No product available",
                        style: TextStyle(
                          fontSize: 18.311471939086914.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: GridView.builder(
                      itemCount: filteredProducts.length,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 8 / 8),
                      itemBuilder: (context, index) {
                        final productData =
                            productList[index].data() as Map<String, dynamic>;
                        final productName = productData['p_name'];
                        final productPrice = productData['p_price'];
                        final productDescription = productData['p_description'];
                        final imageUrl = productData['p_image'];
                        final categoryId = productData['p_categoryId'];
                        final productStock = productData['p_stock'];
                        log('$categoryId list of category products');

                        return CustomCard(
                          colors: const [
                            Color.fromRGBO(50, 52, 59, 1),
                            Color.fromRGBO(72, 76, 87, 1),
                            Color.fromRGBO(29, 31, 35, 1),
                          ],
                      
                          radius: 18.r,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 20,
                                right: 20,
                                child: FittedBox(
                                    child:
                                        CashNetworkImage(imageUrl: imageUrl)),
                              ),
                              Positioned(
                                bottom: 60.h,
                                left: 20.w,
                                child: Text(
                                  productName,
                                  style: TextStyle(
                                    fontSize: 18.3.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10.h,
                                right: 15.w,
                                child: ArrowCustomButton(
                                  onTap: () async {
                                    CustomNavigator.navigationPush(
                                      context: context,
                                      child: ItemOnClick(
                                          docId: '',
                                          productStock: productStock,
                                          imageUrl: imageUrl,
                                          productName: productName,
                                          productPrice: productPrice,
                                          productRating: '',
                                          productDescription:
                                              productDescription),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 20.h,
                                left: 20.w,
                                child: Text(
                                  "₹ $productPrice",
                                  style: TextStyle(
                                    fontSize: 18.311471939086914.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return Center(child: Text('Error: $error'));
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
