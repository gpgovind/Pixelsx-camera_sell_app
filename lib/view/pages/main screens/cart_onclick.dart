import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/const_path.dart';

class CartOnClick extends ConsumerStatefulWidget {
  final String imageUrl;
  final String productName;
  final String productStock;
  final String productPrice;
  final String productRating;
  final String productDescription;

  const CartOnClick({
    super.key,
    required this.imageUrl,
    required this.productStock,
    required this.productName,
    required this.productPrice,
    required this.productRating,
    required this.productDescription,
  });

  @override
  ConsumerState<CartOnClick> createState() => _ItemOnClickState();
}

class _ItemOnClickState extends ConsumerState<CartOnClick> {
  final _bottomBarController = BottomBarWithSheetController(initialIndex: -1);
  int stock = 1;

  @override
  void initState() {
    _bottomBarController.openSheet();
    super.initState();
  }

  int parseStock() {
    int productStock = int.parse(widget.productStock);
    return productStock;
  }

  @override
  Widget build(BuildContext context) {
    // final product = ref.watch(productProvider);
    // final cart = ref.watch(userCartProvider);

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
          onSelectItem: (index) {},
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
                            Text('price : ₹ ${widget.productPrice}',
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
            ),
          ),
          items: const [
            // BottomBarWithSheetItem(icon: Icons.shopping_cart),
            // BottomBarWithSheetItem(icon: Icons.favorite),
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
