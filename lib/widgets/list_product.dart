import 'dart:developer';

import 'package:camera_sell_app/widgets/widget_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../screens/pages/main screens/item_on_click.dart';
import '../utils/const_path.dart';

class ProductItem extends ConsumerStatefulWidget {
  final String imageUrl;
  final String productName;
  final String productStock;
  final String productPrice;
  final double productRating;
  final String productDescription;
  final String docId;
  final DocumentReference reference;

  const ProductItem(
      {super.key,
      required this.imageUrl,
      required this.productName,
      required this.productStock,
      required this.productPrice,
      required this.productRating,
      required this.productDescription,
      required this.docId,
      required this.reference});

  @override
  ConsumerState<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends ConsumerState<ProductItem>
    with TickerProviderStateMixin {
  late AnimationController _favoriteController;
  @override
  void initState() {
    _favoriteController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productProvider);
    log(widget.reference.toString());
    return ShadeContainer(
      key: UniqueKey(),
      radius: 18,
      child: Stack(
        children: [
          Positioned(
            top: 2,
            right: 1,
            child: IconButton(
              splashRadius: 50,
              iconSize: 100,
              onPressed: () {
                _favoriteController.reset();
                _favoriteController.forward().then((value) {
                  product.addToWishList(widget.docId);
                });
              },
              icon: Lottie.asset(Icons8.heart_color,
                  height: 28, controller: _favoriteController),
            ),
          ),
          Positioned(
            top: 35,
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
            left: 2,
            top: 10,
            child: Image.asset(
              ratingIcon,
              width: 23.w,
              height: 23.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 25,
            top: 10,
            child: Text(
              widget.productRating.toStringAsFixed(1),
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
                      reference: widget.reference,
                      docId: widget.docId,
                      productStock: widget.productStock,
                      imageUrl: widget.imageUrl,
                      productName: widget.productName,
                      productPrice: widget.productPrice,
                      productRating: widget.productRating,
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
