import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view/pages/main screens/category_product_list.dart';
import '../utils/const_path.dart';
import 'widget_path.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget(
      {super.key,
      required this.categoryImage,
      required this.categoryName,
      required this.docId});

  final String categoryName;
  final String docId;
  final String categoryImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomNavigator.navigationPush(
            context: context,
            child: CategoryProductList(category: categoryName, docId: docId));
      },
      child: ShadeContainer(
          key: UniqueKey(),
          radius: 18,
          child: Column(
            children: [
              CashNetworkImage(imageUrl: categoryImage),
              SizedBox(
                height: 10,
              ),
              FittedBox(
                child: Text(categoryName,
                    style: TextStyle(
                        fontSize: 20.519121170043945.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ),
            ],
          )),
    );
  }
}
