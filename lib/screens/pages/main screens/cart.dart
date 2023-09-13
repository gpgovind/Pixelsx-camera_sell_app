import 'package:camera_sell_app/screens/pages/main%20screens/cart_onclick.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';
import '../../../utils/const_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/widget_path.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({super.key});

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartContentsProvider);
    final product = ref.watch(productListProvider);
    return backgroundColor(
        child: product.when(
            data: (productData) {
              return Scaffold(
                  extendBody: true,
                  backgroundColor: Colors.transparent,
                  bottomNavigationBar: Container(
                    width: double.infinity,
                    height: 280.h,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Color(0xff363940)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Order Info",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Subtotal",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                  Text("₹ 110",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400))
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Shipping cost",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white)),
                                  Text("₹ 10",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white))
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red)),
                                  Text("₹ 120000",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red))
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              customCheckOutButton
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: cart.when(
                      data: (userCartData) {
                        return SafeArea(
                            child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 10,
                                    ),
                                itemCount: userCartData.length,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                itemBuilder: (context, index) {
                                  final cartData = userCartData[index].data()
                                      as Map<String, dynamic>;
                                  final cartReference =
                                      cartData['productReference']
                                          as DocumentReference;

                                  // Find the corresponding product in productData
                                  final matchingProduct =
                                      productData.firstWhere(
                                    (product) =>
                                        product.reference == cartReference,
                                  );

                                  final productPrice =
                                      matchingProduct['p_price'];
                                  final productName = matchingProduct['p_name'];
                                  final productStock =
                                      matchingProduct['p_stock'];
                                  final productDescription =
                                      matchingProduct['p_description'];
                                  final imageUrl = matchingProduct['p_image'];
                                  if (userCartData.isEmpty) {
                                    return const Text(
                                        'Cart is empty.'); // Handle empty cart
                                  }
                                  return GestureDetector(
                                    onTap: () {
                                      CustomNavigator.navigationPush(
                                        context: context,
                                        child: CartOnClick(
                                            productStock: productStock,
                                            imageUrl: imageUrl,
                                            productName: productName,
                                            productPrice: productPrice,
                                            productRating: '',
                                            productDescription:
                                                productDescription),
                                      );
                                    },
                                    child:GridAnimatorWidget (
                                      child: ShadeContainer(
                                        elevation: 3,
                                          height: 200,
                                          radius: 25,
                                          child: Padding(
                                            padding: const EdgeInsets.all(9.0),
                                            child: Stack(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    // Row(
                                                    //   children: [
                                                    //     Image.asset(
                                                    //       ratingIcon,
                                                    //       width: 23.w,
                                                    //       height: 23.h,
                                                    //       fit: BoxFit.cover,
                                                    //     ),
                                                    //     const SizedBox(
                                                    //       width: 2,
                                                    //     ),
                                                    //     Text("4.8",
                                                    //         style: TextStyle(
                                                    //             fontSize:
                                                    //                 19.311471939086914
                                                    //                     .sp,
                                                    //             fontWeight:
                                                    //                 FontWeight
                                                    //                     .w400,
                                                    //             color: Colors
                                                    //                 .white)),
                                                    //     SizedBox(
                                                    //       width: 10.h,
                                                    //     ),
                                                    //     Text("(500 reviews)",
                                                    //         style: TextStyle(
                                                    //             fontSize:
                                                    //                 19.311471939086914
                                                    //                     .sp,
                                                    //             fontWeight:
                                                    //                 FontWeight
                                                    //                     .w400,
                                                    //             color:
                                                    //                 Colors.white))
                                                    //   ],
                                                    // ),
                                                    SizedBox(
                                                      height: 150,
                                                      width: 150,
                                                      child: Wrap(
                                                        direction: Axis.vertical,
                                                        children: [
                                                          FittedBox(
                                                            child: Text(
                                                                productName,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        22.519121170043945
                                                                            .sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          FittedBox(
                                                            child: Row(
                                                              children: [
                                                                const Text(
                                                                    "price ₹",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17.863384246826172,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color: Colors
                                                                            .white)),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(productPrice,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17.863384246826172,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color: Colors
                                                                                .red[
                                                                            300])),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          FittedBox(
                                                            child: Row(
                                                              children: [
                                                                const Text(
                                                                    "Stock",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17.863384246826172,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color: Colors
                                                                            .white)),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(productStock,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17.863384246826172,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color: Colors
                                                                                .red[
                                                                            300])),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Row(
                                                    children: [
                                                      CustomButton(
                                                          buttonName: 'buy',
                                                          hight: 50,
                                                          radius: 18,
                                                          width: 120),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      CustomButton(
                                                          buttonName: 'WishList',
                                                          hight: 50,
                                                          radius: 18,
                                                          width: 120)
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Column(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: CashNetworkImage(
                                                            imageUrl: imageUrl),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.end,
                                                        children: [
                                                          customIncreaseButton(),
                                                          SizedBox(
                                                            width: 10.h,
                                                          ),
                                                          Text("01",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      24.498355865478516
                                                                          .sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white)),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          customDegreesButton(),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                  );
                                }));
                      },
                      error: (error, stackTrace) => loading(),
                      loading: loading));
            },
            error: (error, stackTrace) => loading(),
            loading: loading));
  }
}
