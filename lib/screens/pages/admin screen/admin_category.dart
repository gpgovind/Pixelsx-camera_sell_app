
import 'package:camera_sell_app/widgets/widget_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/const_path.dart';

class AdminCategory extends ConsumerStatefulWidget {
  const AdminCategory({super.key});

  @override
  ConsumerState<AdminCategory> createState() => _AdminCategoryState();
}

class _AdminCategoryState extends ConsumerState<AdminCategory> {
  TextEditingController productCategoryController = TextEditingController();

  @override
  void dispose() {
    productCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = ref.watch(productCategory);
    final addCategory = ref.watch(productProvider);
    return backgroundColor(
        child: Column(
      children: [
        categoryList.when(
          data: (data) {
            return Expanded(
              child: GridView.builder(
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 8 / 9),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                itemBuilder: (BuildContext context, int index) {
                  final productData =
                      data[index].data() as Map<String, dynamic>;
                  final category = productData['p_Category'];
                  final categoryImage = productData['p_image'];
                  final categoryName = category.toString().toUpperCase();
                  final id = data[index].id;

                  return CustomCard(
                      colors: const [
                        Color.fromRGBO(50, 52, 59, 1),
                        Color.fromRGBO(72, 76, 87, 1),
                        Color.fromRGBO(29, 31, 35, 1),
                      ],
                      cardWidth: double.infinity,
                     
                      radius: 18,
                      // padding: const EdgeInsets.all(8.9),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: CategoryPopupMenu(
                                onDeleteSelected: () {
                                  addCategory.deleteCategory(id: id);
                                },
                                onEditSelected: () {
                                  showCategoryEditInputDialog(
                                      addCategory: addCategory,
                                      context: context,
                                      id: id,
                                      productCategoryController:
                                          productCategoryController,
                                      imageUrl: categoryImage);
                                },
                              )),
                          SizedBox(
                            height: 3.h,
                          ),
                          FittedBox(
                            child: Text(categoryName,
                                style: TextStyle(
                                    fontSize: 20.519121170043945.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CashNetworkImage(imageUrl: categoryImage),
                        ],
                      ));
                },
              ),
            );
          },
          error: (error, stackTrace) => loading(),
          loading: () => loading(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: adminCustomButton(
              text: 'add category',
              onTap: () {
                showCategoryInputDialog(
                  addCategory,
                  ref.context,
                  productCategoryController,
                );
              }),
        )
      ],
    ));
  }
}
