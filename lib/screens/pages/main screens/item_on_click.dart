import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:camera_sell_app/data/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/const_path.dart';


class ItemOnClick extends ConsumerStatefulWidget {
  final String imageUrl;
  final String productName;
  final String productStock;
  final String productPrice;
  final String productRating;
  final String productDescription;
  final String docId;

  const ItemOnClick({
    super.key,
    required this.imageUrl,
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
              EasyLoading.show(
                  indicator: loading(), maskType: EasyLoadingMaskType.clear);
              return product.addToCart(widget.docId).whenComplete(() {
                EasyLoading.dismiss();
                message(context, 'Add to cart');
              });
            } else if (index == 1) {
                 EasyLoading.show(
                  indicator: loading(), maskType: EasyLoadingMaskType.clear);
              return product
                  .createWishListForCurrentUser(
                      context: context,
                      product: Product(
                          price: widget.productPrice,
                          productStock: widget.productStock,
                          productName: widget.productName,
                          productDescription: widget.productDescription,
                          productImage: widget.imageUrl))
                  .whenComplete(() {
                    EasyLoading.dismiss();
                message(context, 'Added to whish list');
              });
            }
          },
          sheetChild: SizedBox(
            height: 300.h,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
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
                        Text(widget.productRating,
                            style: TextStyle(
                                fontSize: 19.311471939086914.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                        SizedBox(
                          width: 10.h,
                        ),
                        // Text("(500 reviews)",
                        //     style: TextStyle(
                        //         fontSize: 19.311471939086914.sp,
                        //         fontWeight: FontWeight.w400,
                        //         color: Colors.white))
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
                          children: [
                            Text(widget.productPrice,
                                style: TextStyle(
                                    fontSize: 25.519121170043945.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                            SizedBox(
                              width: 180.w,
                            ),
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
            ),
          ),
          items: const [
            BottomBarWithSheetItem(
              icon: Icons.shopping_cart,
            ),
            BottomBarWithSheetItem(icon: Icons.favorite),
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
}
