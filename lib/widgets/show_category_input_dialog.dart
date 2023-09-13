import 'package:camera_sell_app/utils/color_and_text.dart';
import 'package:camera_sell_app/utils/const_path.dart';
import 'package:camera_sell_app/widgets/widget_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../services/provider/product_provider.dart';

showCategoryInputDialog(
  ProductProvider addCategory,
  BuildContext context,
  TextEditingController productCategoryController,
) {
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
        ),
        const SizedBox(
          height: 10,
        ),
        CustomNewTextFiled(
            text: 'Category Name',
            hintText: 'enter category',
            height: 80.h,
            keyboardType: TextInputType.text,
            controller: productCategoryController),
      ],
    ),
    buttons: [
      DialogButton(
        onPressed: () async {
          await addCategory
              .uploadImageToFirebase(addCategory.productPickedImage);

          // ignore: use_build_context_synchronously
          await addCategory
              .addCategory(productCategoryController.text.toLowerCase(),
                  context, addCategory.productImageUrl ?? 'null')
              .then((value) => message(context, 'category added '));
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
        ),
        const SizedBox(
          height: 10,
        ),
        CustomNewTextFiled(
            text: 'Category Name',
            hintText: 'enter category',
            height: 80.h,
            keyboardType: TextInputType.text,
            controller: productCategoryController),
      ],
    ),
    buttons: [
      DialogButton(
        onPressed: () async {
          await addCategory
              .uploadImageToFirebase(addCategory.productPickedImage);
          // ignore: use_build_context_synchronously
          await addCategory.editCategory(
              id: id,
              categoryName: productCategoryController.text.toLowerCase(),
              context: context,
              imageurl: addCategory.productImageUrl ?? imageUrl);
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
