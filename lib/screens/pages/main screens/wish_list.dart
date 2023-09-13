// import 'package:camera_sell_app/screens/pages/main%20screens/wishList_item_onclick.dart';
// import 'package:camera_sell_app/utils/const_path.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../widgets/widget_path.dart';

// class WishList extends ConsumerStatefulWidget {
//   const WishList({super.key});

//   @override
//   ConsumerState<WishList> createState() => _WishListState();
// }

// class _WishListState extends ConsumerState<WishList> {
//   // @override
//   // void didChangeDependencies() {
//   //   // Access inherited widget data here
//   //   ref.watch(productProvider).synchronizeCartWithProducts();
//   //   super.didChangeDependencies();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final wishList = ref.watch(userWishListProvider);

//     return Scaffold(
//       body: backgroundColor(
//           child: Column(
//         children: [
//           AppBar(
//             backgroundColor: Colors.transparent,
//             iconTheme: const IconThemeData(color: Colors.white),
//             title: Text(
//               'Wish List',
//               style: TextStyle(
//                 fontSize: 25.311471939086914.sp,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.white,
//               ),
//             ),
//             centerTitle: true,
//           ),
//           wishList.when(
//             data: (data) {
//               return Expanded(
//                 child: GridView.builder(
//                   itemCount: data.length,
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2, childAspectRatio: 8 / 8),
//                   itemBuilder: (context, index) {
//                     final productData =
//                         data[index].data() as Map<String, dynamic>;
//                     final productName = productData['p_name'];
//                     final productPrice = productData['p_price'];
//                     final productStock = productData['p_stock'];
//                     final productDescription = productData['p_description'];
//                     final imageUrl = productData['p_image'];

//                     return CustomCard(
//                       colors: const [
//                         Color.fromRGBO(50, 52, 59, 1),
//                         Color.fromRGBO(72, 76, 87, 1),
//                         Color.fromRGBO(29, 31, 35, 1),
//                       ],
//                       elevation: 4,
//                       radius: 18.r,
//                       child: Stack(
//                         children: [
//                           const Positioned(
//                             top: 10,
//                             left: 20,
//                             child: Row(
//                               children: [
//                                 // Text(
//                                 //   "$productRating",
//                                 //   style: TextStyle(
//                                 //     fontSize: 16.311471939086914.sp,
//                                 //     fontWeight: FontWeight.w400,
//                                 //     color: Colors.white,
//                                 //   ),
//                                 // ),
//                               ],
//                             ),
//                           ),
//                           Positioned(
//                             top: 20,
//                             right: 20,
//                             child: FittedBox(
//                                 child: CashNetworkImage(imageUrl: imageUrl)),
//                           ),
//                           Positioned(
//                             bottom: 60.h,
//                             left: 20.w,
//                             child: Text(
//                               productName,
//                               style: TextStyle(
//                                 fontSize: 18.3.sp,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 10.h,
//                             right: 15.w,
//                             child: ArrowCustomButton(
//                               onTap: () async {
//                                 CustomNavigator.navigationPush(
//                                   context: context,
//                                   child: WishListOnClick(
//                                       productStock: productStock,
//                                       imageUrl: imageUrl,
//                                       productName: productName,
//                                       productPrice: productPrice,
//                                       productRating: '',
//                                       productDescription: productDescription),
//                                 );
//                               },
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 20.h,
//                             left: 20.w,
//                             child: Text(
//                               "₹ $productPrice",
//                               style: TextStyle(
//                                 fontSize: 18.311471939086914.sp,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//             error: (error, stackTrace) => Text(
//               error.toString(),
//               style: TextStyle(
//                 fontSize: 18.311471939086914.sp,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.white,
//               ),
//             ),
//             loading: () => loadingScreen,
//           ),
//         ],
//       )),
//     );
//   }
// }
