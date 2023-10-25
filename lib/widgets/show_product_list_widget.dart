import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/const_path.dart';
import 'widget_path.dart';

class ShowSearchResult extends StatelessWidget {
  const ShowSearchResult(
      {super.key,
      required this.productName,
      required this.imageUrl,
      required this.productPrice,
      required this.productStock});
  final String productName;
  final String productPrice;
  final String productStock;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ShadeContainer(
        elevation: 3,
        height: 100,
        radius: 25,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Stack(
            children: [
               FittedBox(
                        child: Text(productName,
                            style: TextStyle(
                                fontSize: 22.519121170043945.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Positioned(
                        left: 5,
                   bottom: 10,
                        child: FittedBox(
                          child: Row(
                            children: [
                              const Text("price ₹",
                                  style: TextStyle(
                                      fontSize: 17.863384246826172,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(productPrice,
                                  style: TextStyle(
                                      fontSize: 17.863384246826172,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red[300])),
                            ],
                          ),
                        ),
                      ),
              Align(
                alignment: Alignment.topRight,
                child: CashNetworkImage(
                    hight: 100, width: 100, imageUrl: imageUrl),
              ),
            ],
          ),
        ));
  }
}
