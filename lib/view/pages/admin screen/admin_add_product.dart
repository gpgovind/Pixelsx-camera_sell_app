import 'package:camera_sell_app/utils/background_color.dart';
import 'package:camera_sell_app/view/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/const_path.dart';
import '../../widgets/widget_path.dart';

class AdminAddProduct extends StatefulWidget {
  const AdminAddProduct({super.key});

  @override
  State<AdminAddProduct> createState() => _AdminAddProductState();
}

class _AdminAddProductState extends State<AdminAddProduct> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return backgroundColor(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: 10.sh,
            child: Column(
              children: [
                CustomCard(
                  elevation: 3,
                  cardWidth: double.infinity,
                  cardHight: 0.9.sh,
                  padding: const EdgeInsets.all(8.8),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: customText(
                            text: 'Image',
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      ),
                      ImagePickerWidget(
                        radius: 80.r,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: SizedBox(
                            width: double.infinity,
                            height: 5.sh,
                            child: Column(
                              children: [
                                CustomNewTextFiled(
                                    text: 'Name',
                                    hintText: 'enter name',
                                    height: 80.h,
                                    keyboardType: TextInputType.text,
                                    controller: productNameController),
                                CustomNewTextFiled(
                                    text: 'price',
                                    hintText: 'enter price',
                                    height: 80.h,
                                    keyboardType: TextInputType.number,
                                    controller: productPriceController),
                                CustomNewTextFiled(
                                    text: 'description',
                                    hintText: 'enter description',
                                    height: 120.h,
                                    maxLines: 4,
                                    keyboardType: TextInputType.text,
                                    controller: productPriceController),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: adminCustomButton(
                      text: 'save product',
                      onTap: () {
                        // CustomNavigator.navigationPush(
                        //     context: context, child: const CreateCategory());
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: adminCustomButton(
                      text: 'cancel',
                      onTap: () {
                        // CustomNavigator.navigationPush(
                        //     context: context, child: const CreateCategory());
                      }),
                )
              ],
            ),
          ),
        ),
      )),
    ));
  }
}
