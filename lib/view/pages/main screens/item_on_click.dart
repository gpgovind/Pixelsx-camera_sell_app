import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/const_path.dart';



class ItemOnClick extends StatefulWidget {

  final String imageUrl;
  final String productName;
  final String productPrice;
  final String productRating;
  final String productDescription;

  const ItemOnClick({super.key,
      required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.productRating,
    required this.productDescription,});

  @override
  State<ItemOnClick> createState() => _ItemOnClickState();
}

class _ItemOnClickState extends State<ItemOnClick> {
  final _bottomBarController = BottomBarWithSheetController(initialIndex: -1);

  @override
  void initState() {
    _bottomBarController.stream.listen((opened) {
      debugPrint('Bottom bar ${opened ? 'opened' : 'closed'}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          onSelectItem: (index) => debugPrint('$index'),
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
                          'lib/assets/rating-icon.png',
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
                        Text("(500 reviews)",
                            style: TextStyle(
                                fontSize: 19.311471939086914.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white))
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
                            customIncreaseButton,
                            SizedBox(
                              width: 10.h,
                            ),
                            Text("01",
                                style: TextStyle(
                                    fontSize: 24.498355865478516.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                            const SizedBox(
                              width: 10,
                            ),
                            customDegreesButton,
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
            BottomBarWithSheetItem(icon: Icons.shopping_cart),
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
                       child: CashNetworkImage(imageUrl: widget.imageUrl),),
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


//  Stack(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 100.h,
//                   ),
//                   Text("SONY 200mm Zoom \n₹ 6000",
//                       style: TextStyle(
//                           fontSize: 25.519121170043945.sp,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white)),
//                   SizedBox(
//                     width: 20.h,
//                   ),
//                 ],
//               ),
//               Positioned(
//                 top: 100.h,
//                 left: 2,
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       'lib/assets/rating-icon.png',
//                       width: 23.w,
//                       height: 23.h,
//                       fit: BoxFit.cover,
//                     ),
//                     const SizedBox(
//                       width: 2,
//                     ),
//                     Text("4.8",
//                         style: TextStyle(
//                             fontSize: 19.311471939086914.sp,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.white)),
//                     SizedBox(
//                       width: 10.h,
//                     ),
//                     Text("(500 reviews)",
//                         style: TextStyle(
//                             fontSize: 19.311471939086914.sp,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.white))
//                   ],
//                 ),
//               ),
//               Positioned(
//                   right: 2,
//                   top: 50.h,
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       customIncreaseButton,
//                       SizedBox(
//                         width: 10.h,
//                       ),
//                       Text("01",
//                           style: TextStyle(
//                               fontSize: 24.498355865478516.sp,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.white)),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       customDegreesButton,
//                     ],
//                   )),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Container(
//                     // Set appropriate height and width for the container
//                     height: 200.h,
//                     width: double.infinity,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           Text(
//                             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisis tellus, est lacus arcu ut ac in fermentum. Sit eget proin nunc felis quam rutrum metus. Et lacus, maecenas vel et arcu ut adipiscing morbi eget. At arcu varius ullamcorper eu varius  ",
//                             style: TextStyle(
//                               fontSize: 22.863384246826172.sp,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 40.h,
//                   // )
//                 ],
//               )
//             ],
//           ),