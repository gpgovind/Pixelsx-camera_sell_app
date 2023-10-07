import 'package:camera_sell_app/utils/const_path.dart';
import 'package:camera_sell_app/widgets/widget_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../services/provider/product_provider.dart';

showCategoryInputDialog(
    ProductProvider addCategory,
    BuildContext context,
    TextEditingController productCategoryController,
    GlobalKey<FormState> formKey) {
  Alert(
    style: AlertStyle(
        isOverlayTapDismiss: false,
        backgroundColor: customAppBarColor,
        titleStyle: TextStyle(color: customTextColor)),
    context: context,
    // type: AlertType.error,
    title: "Add Category",
    content: Column(
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
        Form(
          key: formKey,
          child: CustomNewTextFiled(
              text: 'Category Name',
              hintText: 'enter category',
              validatorText: 'please enter category name',
              height: 80.h,
              keyboardType: TextInputType.text,
              controller: productCategoryController),
        ),
      ],
    ),
    buttons: [
      DialogButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            EasyLoading.show(
                indicator: esLoading(), maskType: EasyLoadingMaskType.clear);
            if (addCategory.productPickedImage != null) {
              await addCategory
                  .uploadImageToFirebase(addCategory.productPickedImage);
              // ignore: use_build_context_synchronously
              await addCategory
                  .addCategory(
                      categoryName:
                          productCategoryController.text.toUpperCase(),
                      context: context,
                      url: addCategory.productImageUrl)
                  .whenComplete(() {
                EasyLoading.dismiss();
              });
            } else {
              EasyLoading.showInfo('pick image');
            }
          }

          // ignore: use_build_context_synchronously
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

showCategoryEditInputDialog({
  required ProductProvider addCategory,
  required BuildContext context,
  required final imageUrl,
  required id,
  required String categoryName,
  required TextEditingController productCategoryController,
}) {
  Alert(
    style: AlertStyle(
        isOverlayTapDismiss: false,
        backgroundColor: customAppBarColor,
        titleStyle: TextStyle(color: customTextColor)),
    context: context,
    // type: AlertType.error,
    title: "Add Category",
    content: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        ImagePickerWidget(
          radius: 80.r,
          imageUrl: imageUrl,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomNewTextFiled(
            text: 'Category Name',
            hintText: categoryName,
            height: 80.h,
            keyboardType: TextInputType.text,
            controller: productCategoryController),
      ],
    ),
    buttons: [
      DialogButton(
        onPressed: () async {
          EasyLoading.show(
              indicator: esLoading(), maskType: EasyLoadingMaskType.clear);
          if (addCategory.productPickedImage != null) {
            await addCategory
                .uploadImageToFirebase(addCategory.productPickedImage);
          }

          // ignore: use_build_context_synchronously
          await addCategory
              .editCategory(
                  id: id,
                  categoryName: productCategoryController.text.isEmpty
                      ? categoryName
                      : productCategoryController.text.toUpperCase(),
                  context: context,
                  imageurl: addCategory.productImageUrl ?? imageUrl)
              .whenComplete(() {
            EasyLoading.dismiss();
          });
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
