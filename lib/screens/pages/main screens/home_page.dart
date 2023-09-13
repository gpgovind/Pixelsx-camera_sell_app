import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';
import '../../../widgets/widget_path.dart';
import '../../../utils/const_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late AnimationController _favoriteController;

  @override
  void initState() {
    _favoriteController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    _favoriteController.dispose();
    final product = ref.watch(productProvider);
    product.productPickedImage = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productListAsyncValue = ref.watch(productListProvider);

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
                      appLog,
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
                    IconButton(
                      key: UniqueKey(),
                      splashRadius: 50,
                      iconSize: 100,
                      onPressed: () {
                        _favoriteController.reset();
                        _favoriteController.forward();
                      },
                      icon: Lottie.asset(Icons8.heart_color,
                          height: 25, controller: _favoriteController),
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
                    Text("New",
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
            Expanded(
              child: SizedBox(
                  width: double.infinity,
                  height: 10.sh,
                  child: productListAsyncValue.when(
                    data: (productList) {
                      return GridView.builder(
                        itemCount: productList.length,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 8 / 8),
                        itemBuilder: (context, index) {
                          final productData =
                              productList[index].data() as Map<String, dynamic>;
                          final productName = productData['p_name'];
                          final productPrice = productData['p_price'];
                          final productStock = productData['p_stock'];
                          final productDescription =
                              productData['p_description'];
                          final imageUrl = productData['p_image'];
                          final docId = productList[index].id;

                          return  GridAnimatorWidget(
                            child: ProductItem(
                              productIndex: index,
                              imageUrl: imageUrl,
                              productName: productName,
                              productStock: productStock,
                              productPrice: productPrice,
                              productRating: '',
                              productDescription: productDescription,
                              docId: docId,
                            ),
                          );
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      return Center(child: Text('Error: $error'));
                    },
                    loading: () {
                      return const SizedBox.shrink();
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
