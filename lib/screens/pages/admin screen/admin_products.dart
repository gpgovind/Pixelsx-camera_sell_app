import 'package:camera_sell_app/widgets/add_product_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/const_path.dart';
import '../../../widgets/widget_path.dart';
import 'admin_product_edit.dart';

class AdminProducts extends ConsumerStatefulWidget {
  const AdminProducts({super.key});

  @override
  ConsumerState<AdminProducts> createState() => _AdminProductsState();
}

class _AdminProductsState extends ConsumerState<AdminProducts> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productStockController = TextEditingController();
  final TextEditingController productCategoryController =
      TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();
  @override
  void dispose() {
    productNameController.dispose();
    productPriceController.dispose();
    productCategoryController.dispose();
    productDescriptionController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final productListAsyncValue = ref.watch(productListProvider);
    final addProduct = ref.watch(productProvider);
    return backgroundColor(
      child: Column(
        children: [
          // const CustomSearchBar(),
          productListAsyncValue.when(
            data: (data) {
              return Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 8 / 8),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final productData =
                        data[index].data() as Map<String, dynamic>;
                    final productName = productData['p_name'];
                    final name = productName.toString().toLowerCase();
                    final productPrice = productData['p_price'];
                    final imageUrl = productData['p_image'];
                    final productStock = productData['p_stock'];
                    final productDescription = productData['p_description'];
                    final productCategoryId = productData['p_categoryId'];
                    final docId=data[index].id;
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomCard(
                          colors: const [
                            Color.fromRGBO(50, 52, 59, 1),
                            Color.fromRGBO(72, 76, 87, 1),
                            Color.fromRGBO(29, 31, 35, 1),
                          ],
                         
                          radius: 18.r,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 20,
                                right: 20,
                                child: FittedBox(
                                    child:
                                        CashNetworkImage(imageUrl: imageUrl)),
                              ),
                              Positioned(
                                bottom: 60.h,
                                left: 20.w,
                                child: Text(
                                  name,
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
                                  icon: Icons.arrow_back_outlined,
                                  onTap: () async {
                                    CustomNavigator.navigationPush(
                                      context: context,
                                      child: ProductEdit(
                                        docId: docId,
                                          productCategoryId: productCategoryId,
                                          imageUrl: imageUrl,
                                          productStock: productStock,
                                          productName: productName,
                                          productPrice: productPrice,
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
                                  " $productPrice ₹",
                                  style: TextStyle(
                                    fontSize: 18.311471939086914.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                ),
              );
            },
            error: (error, stackTrace) =>  loading(),
            loading: () =>  loading(),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: adminCustomButton(
                text: 'Add Product',
                onTap: () => addProductInputDialog(
                    formKey: formKey,
                    addProduct: addProduct,
                    context: context,
                    productNameController: productNameController,
                    productPriceController: productPriceController,
                    productCategoryController: productCategoryController,
                    productDescriptionController: productDescriptionController,
                    productStockController: productStockController)),
          )
        ],
      ),
    );
  }
}
