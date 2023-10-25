
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/product_model.dart';
import '../../../utils/const_path.dart';
import 'order_info_screen.dart';

class ItemOnClick extends ConsumerStatefulWidget {
  final String imageUrl;
  final String productName;
  final String productStock;
  final String productPrice;
  final double productRating;
  final String productDescription;
  final String docId;
  final  DocumentReference reference;
  

  const ItemOnClick({
    super.key,
    required this.imageUrl,
    required this.reference,
    required this.docId,
    required this.productStock,
    required this.productName,
    required this.productPrice,
    required this.productRating,
    required this.productDescription,
  });

  @override
  ConsumerState<ItemOnClick> createState() => _ItemOnClickState();
}

class _ItemOnClickState extends ConsumerState<ItemOnClick> {
  final _bottomBarController = BottomBarWithSheetController(initialIndex: -1);

  @override
  void initState() {
    _bottomBarController.openSheet();
    super.initState();
  }

  int count = 1;
  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productProvider);
    return backgroundColor(
      child: Scaffold(
        bottomNavigationBar: BottomBarWithSheet(
          controller: _bottomBarController,
          bottomBarTheme: const BottomBarTheme(
            mainButtonPosition: MainButtonPosition.middle,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(50, 52, 59, 1),
                    Color.fromRGBO(72, 76, 87, 1),
                    Color.fromRGBO(29, 31, 35, 1),
                  ],
                )),
            selectedItemIconColor: Colors.white,
            itemIconColor: Colors.grey,
            itemTextStyle: TextStyle(
              color: Colors.grey,
              fontSize: 10.0,
            ),
            selectedItemTextStyle: TextStyle(
              color: Colors.blue,
              fontSize: 10.0,
            ),
          ),
          onSelectItem: (index) async {
            if (index == 0) {
              return product.addToCart(widget.docId);
            } else if (index == 2) {
              return product.addToWishList(widget.docId);
            } else if (index == 1) {
             
              return CustomNavigator.navigationPush(
                  context: context,
                  child: OrderInfoScreen(
                    reference: widget.reference,
                    items: Product(
                        price: widget.productPrice,
                        productStock: widget.productStock,
                        productName: widget.productName,
                        productDescription: widget.productDescription,
                        productImage: widget.imageUrl),
                  ));
            }
          },
          sheetChild: Column(
            children: [
              showItem(),
            ],
          ),
          items: const [
            BottomBarWithSheetItem(
              label: 'cart',
              icon: Icons.add_shopping_cart,
            ),
            BottomBarWithSheetItem(
              label: 'buy',
              icon: Icons.shop,
            ),
            BottomBarWithSheetItem(label: 'wish List', icon: Icons.favorite),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InteractiveViewer(
                    child: Center(
                      child: CashNetworkImage(imageUrl: widget.imageUrl),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded showItem() {
    return Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 10.sh,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  ratingIcon,
                                  width: 23.w,
                                  height: 23.h,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(  widget.productRating.toStringAsFixed(1),
                                    style: TextStyle(
                                        fontSize: 19.311471939086914.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                                const Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.productName,
                                    style: TextStyle(
                                        fontSize: 25.519121170043945.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("price ₹ ${widget.productPrice}",
                                        style: TextStyle(
                                            fontSize: 25.519121170043945.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                   
                                    Text("only ${widget.productStock} left",
                                        style: TextStyle(
                                            fontSize: 24.498355865478516.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.red[400])),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 33,
                            ),
                            Text(
                              widget.productDescription,
                              style: TextStyle(
                                fontSize: 22.863384246826172.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
}
