import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/const_path.dart';
import '../../../widgets/widget_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productListProvider);
    return backgroundColor(
        child: product.when(
            data: (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomCard(
                              border: Border.all(
                                width: 2,
                                color: const Color.fromRGBO(146, 146, 146, 1),
                              ),
                              cardWidth: 550.w,
                              cardHight: 350.h,
                              colors: const [
                                Color(0x356b7180),
                                Color(0x356b7180),
                                Color(0x356b7180),
                              ],
                              radius: 22,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text("Dashboard",
                                        style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomCard(
                                            cardHight: 150.w,
                                            cardWidth: 200.h,
                                            radius: 18,
                                            border: Border.all(
                                              width: 2,
                                              color: const Color.fromRGBO(
                                                  146, 146, 146, 1),
                                            ),
                                            colors: const [
                                              Color(0x356b7180),
                                              Color(0x356b7180),
                                              Color(0x356b7180),
                                            ],
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Total sales",
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white)),
                                                Text("0",
                                                    style: TextStyle(
                                                        fontSize: 25.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white))
                                              ],
                                            )),
                                        CustomCard(
                                            cardHight: 150.w,
                                            cardWidth: 200.h,
                                            radius: 18,
                                            border: Border.all(
                                              width: 2,
                                              color: const Color.fromRGBO(
                                                  146, 146, 146, 1),
                                            ),
                                            colors: const [
                                              Color(0x356b7180),
                                              Color(0x356b7180)
                                            ],
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Total products",
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white)),
                                                Text(data.length.toString(),
                                                    style: TextStyle(
                                                        fontSize: 25.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white))
                                              ],
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
            error: (error, stackTrace) => loading(),
            loading: loading));
  }
}
