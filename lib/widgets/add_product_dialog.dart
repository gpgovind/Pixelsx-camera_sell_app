import 'package:camera_sell_app/widgets/widget_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../model/product_model.dart';
import '../controller/provider/product_provider.dart';
import '../utils/const_path.dart';

addProductInputDialog({
  required ProductProvider addProduct,
  context,
  required GlobalKey<FormState> formKey,
  required TextEditingController productNameController,
  required TextEditingController productPriceController,
  required TextEditingController productCategoryController,
  required TextEditingController productDescriptionController,
  required TextEditingController productStockController,
}) {
  Alert(
    style: AlertStyle(
        isOverlayTapDismiss: false,
        backgroundColor: customAppBarColor,
        titleStyle: TextStyle(color: customTextColor)),
    context: context,
    // type: AlertType.error,
    title: "Add Product",
    content: SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ImagePickerAdminSide(
                radius: 80.r,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomNewTextFiled(
                  text: 'Name',
                  hintText: 'enter name',
                  validatorText: 'enter name',
                  height: 80.h,
                  keyboardType: TextInputType.text,
                  controller: productNameController),
              CustomNewTextFiled(
                  text: 'price',
                  hintText: 'enter price',
                  validatorText: 'enter price',
                  height: 80.h,
                  keyboardType: TextInputType.number,
                  controller: productPriceController),
              CustomNewTextFiled(
                  text: 'stock',
                  hintText: 'enter stock',
                  validatorText: 'enter stock',
                  height: 80.h,
                  keyboardType: TextInputType.number,
                  controller: productStockController),
              CustomNewTextFiled(
                  text: 'category',
                  hintText: 'enter category name',
                  validatorText: 'enter category',
                  height: 80.h,
                  keyboardType: TextInputType.text,
                  controller: productCategoryController),
              CustomNewTextFiled(
                  text: 'description',
                  hintText: 'enter description',
                  validatorText: 'enter description',
                  height: 120.h,
                  maxLines: 4,
                  keyboardType: TextInputType.text,
                  controller: productDescriptionController),
            ],
          ),
        ),
      ),
    ),
    buttons: [
      DialogButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            if (addProduct.productPickedImage != null) {
              EasyLoading.show(
                  indicator: esLoading(), maskType: EasyLoadingMaskType.clear);
              await addProduct
                  .uploadImageToFirebase(addProduct.productPickedImage);

              await addProduct
                  .addProduct(
                      categoryName:
                          productCategoryController.text.toUpperCase(),
                      product: Product(
                          productStock: productStockController.text,
                          price: productPriceController.text,
                          productName: productNameController.text,
                          productDescription: productDescriptionController.text,
                          productImage: addProduct.productImageUrl ?? 'null'))
                  .whenComplete(() {
                EasyLoading.dismiss();
              });
            } else {
              EasyLoading.showInfo('pick image');
            }
          }
        },
        width: 120,
        color: customTextColor,
        child: const Text(
          "save",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      )
    ],
  ).show();
}
