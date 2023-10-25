import 'package:camera_sell_app/utils/const_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../view/pages/main screens/cart.dart';
import '../view/pages/main screens/category.dart';
import '../view/pages/main screens/home_page.dart';
import '../view/pages/main screens/settings.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final Color navigationBarColor = const Color(0xff282a2e);
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: backgroundColor(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: const <Widget>[
                HomePage(),
                Category(),
                Cart(),
                Settings()
              ],
            ),
            bottomNavigationBar: Container(
              height: 70,
              decoration: BoxDecoration(
                color: navigationBarColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: WaterDropNavBar(
                waterDropColor: Colors.white,
                inactiveIconColor: Colors.white54,
                backgroundColor: navigationBarColor,
                onItemSelected: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                  pageController.animateToPage(selectedIndex,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOutQuad);
                },
                selectedIndex: selectedIndex,
                barItems: <BarItem>[
                  BarItem(
                    filledIcon: Icons.home_rounded,
                    outlinedIcon: Icons.home_outlined,
                  ),
                  BarItem(
                    filledIcon: Icons.category_rounded,
                    outlinedIcon: Icons.category_outlined,
                  ),
                  BarItem(
                    filledIcon: Icons.shopping_cart,
                    outlinedIcon: Icons.shopping_cart_outlined,
                  ),
                  BarItem(
                    filledIcon: Icons.settings_rounded,
                    outlinedIcon: Icons.settings_outlined,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
