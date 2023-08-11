import 'package:camera_sell_app/view/pages/admin%20screen/create_category.dart';
import 'package:camera_sell_app/view/widgets/widget_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/const_path.dart';

class AdminCategory extends StatelessWidget {
  const AdminCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return backgroundColor(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Category",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: customTextColor)),
            ],
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: SizedBox(
            height: 10.sh,
            width: double.infinity,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (200 / 250),
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                CustomCard(
                    cardHight: 600,
                    cardWidth: 300.w,
                      radius: 18,
                    padding: const EdgeInsets.all(8.9),
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FittedBox(
                          child: Text("Action",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: customTextColor)),
                        ),
                        Image.asset(
                          'lib/assets/camera -5.png',
                          fit: BoxFit.cover,
                          height: 130.h,
                          width: 150.w,
                        ),
                        customSelectButton(onTap: () {})
                      ],
                    )),
                CustomCard(
                    cardHight: 300.h,
                    cardWidth: 300.w,
                      radius: 18,
                    padding: const EdgeInsets.all(8.9),
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FittedBox(
                          child: Text("DSLR ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: customTextColor)),
                        ),
                        Image.asset(
                          'lib/assets/camera photo -2.png',
                          fit: BoxFit.cover,
                          height: 130.h,
                          width: 189.w,
                        ),
                        customSelectButton()
                      ],
                    )),
                CustomCard(
                    cardHight: 300.h,
                    cardWidth: 300.w,
                      radius: 18,
                    padding: const EdgeInsets.all(8.9),
                    elevation: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FittedBox(
                          child: Text("Point-and-Shoot",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: customTextColor)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          'lib/assets/camera photo-1.png',
                          height: 140.h,
                          width: 160.w,
                          fit: BoxFit.cover,
                        ),
                        customSelectButton()
                      ],
                    )),
                CustomCard(
                    cardHight: 300.h,
                    cardWidth: 300.w,
                    padding: const EdgeInsets.all(8.9),
                    elevation: 2,
                    radius: 18,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FittedBox(
                          child: Text("Film",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: customTextColor)),
                        ),
                        Image.asset(
                          'lib/assets/camera photo-4.png',
                          height: 140.h,
                          width: 160.w,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customSelectButton()
                      ],
                    )),
              ],
            ),
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: adminCustomButton(
              text: 'add category',
              onTap: () {
                CustomNavigator.navigationPush(
                    context: context, child: const CreateCategory());
              }),
        )
      ],
    ));
  }
}
