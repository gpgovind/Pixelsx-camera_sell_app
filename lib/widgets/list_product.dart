import 'package:camera_sell_app/widgets/widget_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../screens/pages/main screens/item_on_click.dart';
import '../utils/const_path.dart';

class ProductItem extends StatefulWidget {
  final int productIndex;
  final String imageUrl;
  final String productName;
  final String productStock;
  final String productPrice;
  final String productRating;
  final String productDescription;
  final String docId;

  const ProductItem({
    super.key,
    required this.productIndex,
    required this.imageUrl,
    required this.productName,
    required this.productStock,
    required this.productPrice,
    required this.productRating,
    required this.productDescription,
    required this.docId,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return ShadeContainer(
      key: UniqueKey(),
      radius: 18,
      child: Stack(
        children: [
          // Positioned(
          //   top: 5,
          //   right: 2,
          //   child: Row(
          //     children: [
              
          //     ],
          //   ),
          // ),
          Positioned(
            top: 20,
            right: 20,
            child:
                FittedBox(child: CashNetworkImage(imageUrl: widget.imageUrl)),
          ),
          Positioned(
            bottom: 60.h,
            left: 20.w,
            child: Text(
              widget.productName,
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
                      docId: widget.docId,
                      productStock: widget.productStock,
                      imageUrl: widget.imageUrl,
                      productName: widget.productName,
                      productPrice: widget.productPrice,
                      productRating: '',
                      productDescription: widget.productDescription),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            child: Text(
              widget.productPrice,
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
  }
}
