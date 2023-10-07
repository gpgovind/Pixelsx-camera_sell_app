import 'dart:developer';
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
                              crossAxisCount: 2, childAspectRatio: 8 / 9.5),
                      itemBuilder: (context, index) {
                        final productData = filteredProducts[index].data()
                            as Map<String, dynamic>;
                        final productName = productData['p_name'];
                        final productPrice = productData['p_price'];
                        final productDescription = productData['p_description'];
                        final imageUrl = productData['p_image'];
                        final categoryId = productData['p_categoryId'];
                        final productStock = productData['p_stock'];
                        log('$categoryId list of category products');
                        final reference = filteredProducts[index].reference;
                        final docId = filteredProducts[index].id;
                        final currentRating = productData['p_rate'];
                        final rating = currentRating / 5;

                        return ProductItem(
                          docId: docId,
                          imageUrl: imageUrl,
                          productDescription: productDescription,
                          productName: productName,
                          productPrice: productPrice,
                          productRating: rating,
                          productStock: productStock,
                          reference: reference,
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
