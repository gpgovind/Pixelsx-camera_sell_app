import 'package:animated_rail/animated_rail.dart';
import 'package:flutter/material.dart';
import '../screens/pages/admin screen/admin_category.dart';
import '../screens/pages/admin screen/admin_products.dart';
import '../screens/pages/admin screen/admin_users.dart';
import '../screens/pages/admin screen/dashboard_screen.dart';

class NewCustomizations extends StatelessWidget {
  const NewCustomizations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(54, 57, 65, 1),
        title: const Text('Admin Panel'),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedRail(
              background: const Color.fromRGBO(54, 57, 65, 1),
              maxWidth: 175,
              width: 60,
              direction: TextDirection.rtl,
              railTileConfig: const RailTileConfig(
                iconSize: 22,
                iconColor: Colors.white,
                expandedTextStyle: TextStyle(fontSize: 15),
                collapsedTextStyle:
                    TextStyle(fontSize: 12, color: Colors.white),
                activeColor: Colors.white70,
                iconPadding: EdgeInsets.symmetric(vertical: 5),
                hideCollapsedText: true,
              ),
              cursorSize: const Size(70, 70),
              cursorActionType: CursorActionTrigger.clickAndDrag,
              items: [
                RailItem(
                    icon: const Icon(Icons.dashboard_customize_outlined),
                    label: "Dashboard",
                    screen: const DashboardScreen()),
                RailItem(
                    icon: const Icon(Icons.category_outlined),
                    label: "Category Manage",
                    screen: const AdminCategory()),
                RailItem(
                    icon: const Icon(Icons.person_outline),
                    label: 'Users Manage',
                    screen: const Users()),
                RailItem(
                    icon: const Icon(Icons.inventory_outlined),
                    label: "Products Manage",
                    screen: const AdminProducts()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
