import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/const_path.dart';
import '../../widgets/widget_path.dart';

class CreateCategory extends StatefulWidget {
  const CreateCategory({super.key});

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return backgroundColor(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(54, 57, 65, 1),
          title: customText(text: 'Category'),
          centerTitle: true,
          foregroundColor: customTextColor,
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: 10.sh,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                  child: CustomCard(
                      cardWidth: double.infinity,
                      cardHight: 650.h,
                      margin: const EdgeInsets.all(0.5),
                      radius: 18,
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 1,
                              left: 10,
                              child: customText(text: 'Image',fontSize: 22,fontWeight: FontWeight.w400)
                            ),
                             Positioned(
                              top: 40,
                              child: ImagePickerWidget(radius: 100.r,),
                            ),
                            Positioned(
                              bottom: 20,
                              child: CustomNewTextFiled(
                                  text: 'Category Name',
                                  hintText: 'enter category',
                                  height: 80.h,
                                  keyboardType: TextInputType.text,
                                  controller: categoryController),
                            )
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      adminCustomButton(onTap: () {}, text: 'Add Category'),
                      const SizedBox(
                        height: 20,
                      ),
                      adminCustomButton(onTap: () {}, text: 'Cancel')
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
