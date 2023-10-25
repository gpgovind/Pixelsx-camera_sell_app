import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/product_model.dart';
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

    return backgroundColor(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(color: Colors.white),
                title: Text(
                  widget.category,
                  style: TextStyle(
                    fontSize: 22.311471939086914.sp,
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
                              crossAxisCount: 2, childAspectRatio: 8 / 9.5),
                      itemBuilder: (context, index) {
                        final productDataList =
                            getProductData(filteredProducts[index]);

                        return ProductItem(
                          reference: productDataList['reference'],
                          imageUrl: productDataList['p_image'],
                          productName: productDataList['p_name'],
                          productStock: productDataList['p_stock'],
                          productPrice: productDataList['p_price'],
                          productRating: productDataList['p_rate'],
                          productDescription: productDataList['p_description'],
                          docId: productDataList['doc_id'],
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
