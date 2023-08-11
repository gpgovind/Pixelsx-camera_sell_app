
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/const_path.dart';
import '../../widgets/widget_path.dart';
import '../main screens/search_screen.dart';
import 'admin_add_product.dart';

class AdminProducts extends StatelessWidget {
  const AdminProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return backgroundColor(
      child: Column(
        children: [
          const CustomSearchBar(),
          Expanded(
              child: SingleChildScrollView(
            child: SizedBox(
              height: 10.sh,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomCard(
                        cardHight: 100,
                        radius: 18,
                        cardWidth: double.infinity,
                        elevation: 2,
                        child: Center(
                          child: ListTile(
                            tileColor: Colors.transparent,
                            leading: Transform.translate(
                              offset: const Offset(21.0, 15.0),
                              child: Image.asset(
                                'lib/assets/camera photo -2.png',
                                fit: BoxFit.cover,
                                width: 151.w,
                                height: 137.h,
                              ),
                            ),
                            title: const FittedBox(
                              child: Text("Canon EOS 30D",
                                  style: TextStyle(
                                      fontSize: 15.311471939086914,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                            trailing: const Text("16000",
                                style: TextStyle(
                                    fontSize: 17.863384246826172,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                          ),
                        )),
                  );
                },
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: adminCustomButton(
                text: 'Add Product',
                onTap: () {
                  CustomNavigator.navigationPush(
                      context: context, child: const AdminAddProduct());
                }),
          )
        ],
      ),
    );
  }
}
