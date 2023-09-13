import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/product_model.dart';
import '../../../utils/const_path.dart';
import '../../../widgets/widget_path.dart';

class ProductEdit extends ConsumerStatefulWidget {
  final String imageUrl;
  final String productName;
  final String docId;
  final String productStock;
  final String productPrice;
  final String productDescription;
  final String productCategoryId;

  const ProductEdit({
    super.key,
    required this.imageUrl,
    required this.docId,
    required this.productCategoryId,
    required this.productStock,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
  });

  @override
  ConsumerState<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends ConsumerState<ProductEdit> {
  final productName = TextEditingController();
  final price = TextEditingController();
  final description = TextEditingController();
  final category = TextEditingController();
  final stock = TextEditingController();

  @override
  void dispose() {
    productName.dispose();
    price.dispose();
    description.dispose();
    stock.dispose();
    category.dispose();
    super.dispose();
  }

  Future<String?> showCategory() async {
    final category =
        await ref.watch(productProvider).findCategory(widget.productCategoryId);
    return category;
  }

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productProvider);
    return backgroundColor(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: 5.sh,
                child: Column(
                  children: [
                    ImagePickerWidget(
                      radius: 80.r,
                    ),
                    Column(
                      children: [
                        CustomNewTextFiled(
                          text: 'Name',
                          height: 75.h,
                          hintText: widget.productName,
                          keyboardType: TextInputType.name,
                          controller: productName,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomNewTextFiled(
                              text: 'price',
                              height: 75.h,
                              width: 170,
                              hintText: widget.productPrice,
                              keyboardType: TextInputType.number,
                              controller: price,
                            ),
                            CustomNewTextFiled(
                              text: 'Stock',
                              height: 75.h,
                              width: 170,
                              hintText: widget.productStock,
                              keyboardType: TextInputType.number,
                              controller: stock,
                            ),
                          ],
                        ),
                        CustomNewTextFiled(
                          text: 'description',
                          height: 75.h,
                          hintText: widget.productDescription,
                          keyboardType: TextInputType.text,
                          controller:description,
                        ),
                        FutureBuilder<String?>(
                          future: showCategory(),
                          builder: (BuildContext context,
                              AsyncSnapshot<String?> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return const Text('Error');
                            } else if (!snapshot.hasData) {
                              return const Text('Category not found');
                            } else {
                              return CustomNewTextFiled(
                                text: 'category',
                                height: 75.h,
                                hintText: snapshot.data ?? '',
                                keyboardType: TextInputType.text,
                                controller: category,
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await product.uploadImageToFirebase(
                                product.productPickedImage);
                            // ignore: use_build_context_synchronously
                            await product.editProduct(
                                docId: widget.docId,
                                categoryName: category.text,
                                context: ref.context,
                                product: Product(
                                    price: price.text,
                                    productStock: stock.text,
                                    productName: productName.text,
                                    productDescription: description.text,
                                    productImage: product.productImageUrl ??
                                        widget.imageUrl));
                          },
                          child: const Card(
                            elevation: 5,
                            color: Colors.transparent,
                            child: CustomButton(
                                buttonName: 'save product',
                                hight: 77,
                                radius: 22,
                                width: 313),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ))));
  }
}
