import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';
import '../../../utils/const_path.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widget_path.dart';

class Category extends ConsumerStatefulWidget {
  const Category({super.key});

  @override
  ConsumerState<Category> createState() => _CategoryState();
}

class _CategoryState extends ConsumerState<Category> {
  @override
  Widget build(BuildContext context) {
    final categoryList = ref.watch(productCategory);
    return backgroundColor(
      child: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.8),
            child: categoryList.when(
              data: (data) {
                return GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 9 / 9),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  itemBuilder: (BuildContext context, int index) {
                    final productData =
                        data[index].data() as Map<String, dynamic>;
                    final category = productData['p_Category'];
                    final categoryImage = productData['p_image'];

                    final docId = data[index].id;
                    log(docId.toString());
                    return GridAnimatorWidget(
                      child: CategoryListWidget(
                        categoryImage: categoryImage,
                        docId: docId,
                        categoryName: category,
                      ),
                    );
                  },
                );
              },
              error: (error, stackTrace) => loading(),
              loading: () => loading(),
            )),
      ),
    );
  }
}
