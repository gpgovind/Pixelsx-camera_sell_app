import 'dart:async';
import 'package:camera_sell_app/services/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/widget_path.dart';
import '../../../utils/const_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'item_on_click.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return backgroundColor(
      child: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'lib/assets/log_pixels-removebg-preview.png',
                      fit: BoxFit.cover,
                      height: 101.h,
                      width: 154.w,
                      color: Colors.white,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    IconButton(
                        iconSize: 45.sp,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomCard(
                    colors: const [
                      Color.fromRGBO(50, 52, 59, 1),
                      Color.fromRGBO(72, 76, 87, 1),
                      Color.fromRGBO(29, 31, 35, 1),
                    ],
                    cardHight: 300.h,
                    cardWidth: 0.6.sh,
                    elevation: 3,
                    radius: 18.r,
                    margin: const EdgeInsets.all(7),
                    child: Stack(
                      children: [
                        const SlideImage(),
                        Positioned(
                          left: 15,
                          top: 25,
                          child: Column(
                            children: [
                              Text("New Vintage \nCollection",
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              const SizedBox(
                                height: 20,
                              ),
                              Card(
                                  color: Colors.transparent,
                                  elevation: 9,
                                  child: CustomButton(
                                      buttonName: 'Explore',
                                      hight: 60,
                                      radius: 25.r,
                                      width: 160))
                            ],
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Text("Popular",
                        style: TextStyle(
                            fontSize: 25.519121170043945.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot<Object?>>(
              stream: FireStoreServices.getProductsImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error fetching data'),
                  );
                } else {
                  final products = snapshot.data!.docs;

                  return Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 10.sh,
                      child: GridView.builder(
                        itemCount: products.length,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 8 / 8),
                        itemBuilder: (context, index) {
                          final productData =
                              products[index].data() as Map<String, dynamic>;
                          final productName = productData['P_name'];
                          final productPrice = productData['p_price'];
                          final productRating = productData['p_rating'];
                          final productDescription = productData['P_spec'];
                          final imageUrl = productData['P_image'] as String;

                          return CustomCard(
                            colors: const [
                              Color.fromRGBO(50, 52, 59, 1),
                              Color.fromRGBO(72, 76, 87, 1),
                              Color.fromRGBO(29, 31, 35, 1),
                            ],
                            elevation: 4,
                            radius: 18.r,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 10,
                                  left: 20,
                                  child: Row(
                                    children: [
                                      Text(
                                        "$productRating",
                                        style: TextStyle(
                                          fontSize: 16.311471939086914.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Positioned(
                                //   top: 30,
                                //   right: 50,
                                //   child: FittedBox(
                                //     child: Image.network(
                                //       imageUrl.isNotEmpty
                                //           ? imageUrl
                                //           : 'default_image_url_here',
                                //       width: 100,
                                //       height: 100,
                                //       fit: BoxFit.cover,
                                //     ),
                                //   ),
                                // ),
                                Positioned(
                                  top:20,
                                  right: 20,
                                  child: FittedBox(child: CashNetworkImage(imageUrl: imageUrl)),
                                ),
                                Positioned(
                                  bottom: 60.h,
                                  left: 20.w,
                                  child: Text(
                                    productName,
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
                                            imageUrl: imageUrl,
                                            productName: productName,
                                            productPrice: productPrice,
                                            productRating: productRating,
                                            productDescription:
                                                productDescription),
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  bottom: 20.h,
                                  left: 20.w,
                                  child: Text(
                                    "₹ $productPrice",
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
                        },
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}








// GestureDetector(
//                             onTap: () {
//                               // Handle product tap, e.g., navigate to product details screen
//                             },
//                             child: Card(
//                               // Customize the card appearance
//                               child: Column(
//                                 children: [
//                                   Image.network(
//                                     imageUrl.isNotEmpty
//                                         ? imageUrl
//                                         : 'default_image_url_here',
//                                     width: 100,
//                                     height: 100,
//                                     fit: BoxFit.cover,
//                                   ),
//                                   Text(productName),
//                                   Text('₹ $productPrice'),
//                                   Text('Rating: $productRating'),
//                                 ],
//                               ),
//                             ),
//                           );