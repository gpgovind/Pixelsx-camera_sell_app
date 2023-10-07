import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';

import '../../../data/product_model.dart';
import '../../../utils/const_path.dart';
import '../../../widgets/widget_path.dart';

class CustomSearchBar extends ConsumerStatefulWidget {
  const CustomSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends ConsumerState<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    final productListAsyncValue = ref.watch(productListProvider);

    return backgroundColor(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            foregroundColor: Colors.white,
            title: Text(
              'Search Your product',
              style: TextStyle(color: customTextColor),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: productListAsyncValue.when(
            data: (data) {
              // Extract product data from the List<DocumentSnapshot<Object?>>
              final products = data.map((snapshot) {
                final productData = snapshot.data() as Map<String, dynamic>;
                return Product(
                  productImage: productData['p_image'],
                  productStock: productData['p_stock'],
                  productDescription: productData['p_description'],
                  productName: productData['p_name'],
                  price: productData['p_price'],
                );
              }).toList();

              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: SearchableList<Product>(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  initialList: products,
                  builder: (displayedList, itemIndex, item) {
                    return GridAnimatorWidget(
                      child: ShowSearchResult(
                        productName: item.productName,
                        productPrice: item.price,
                        productStock: item.productStock,
                        imageUrl: item.productImage,
                      ),
                    );
                  },
                  filter: (value) => products
                      .where(
                        (element) =>
                            element.productName.toLowerCase().contains(value),
                      )
                      .toList(),
                  emptyWidget: const Center(
                    child: Text('empty'),
                  ),
                  inputDecoration: InputDecoration(
                    labelText: "Search product",
                    labelStyle: const TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    iconColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              );
            },
            error: (error, stackTrace) => loading(),
            loading: loading,
          ),
        ),
      ),
    );
  }
}
