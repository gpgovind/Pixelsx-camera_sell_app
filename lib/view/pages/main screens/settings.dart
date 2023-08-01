import 'package:camera_sell_app/utils/background_color.dart';
import 'package:camera_sell_app/view/pages/settings%20screens/change_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../services/login.dart';
import '../../../utils/navigation.dart';
import '../settings screens/user_profile_screen.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundColor(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 70.r,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        'lib/assets/rs.jpeg',
                        fit: BoxFit.cover,
                        height: 135.r,
                        width: 135.r,
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      Text("Rasna CK",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      Text("Rasnack@7gmail.com",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(
                      Icons.admin_panel_settings_outlined,
                      color: Colors.white,
                    ),
                    title: Text("Admin",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    trailing: Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),

                  ///---//
                  ListTile(
                    leading: const Icon(
                      Icons.person_3_outlined,
                      color: Colors.white,
                    ),
                    onTap: () {
                      CustomNavigator.navigationPush(
                          context: context, child: const UserProfileScreen());
                    },
                    title: const Text("Account",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    trailing: const Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),

                  ///---///
                  ListTile(
                    leading: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    onTap: () {
                      CustomNavigator.navigationPush(
                          context: context, child: const ChangeAddress());
                    },
                    title: const Text("Change Address",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    trailing: const Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),

                  ///---///
                  const ListTile(
                    leading: Icon(
                      Icons.policy_outlined,
                      color: Colors.white,
                    ),
                    title: Text("Privacy Policy",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    trailing: Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),

                  ///---///
                  const ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                    title: Text("About",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    trailing: Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),

                  ///---///
                  ListTile(
                    leading: const Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                    ),
                    onTap: () {
                      signUserOut(context);
                    },
                    title: const Text("Logout",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    trailing: const Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                    ),
                  ),

                  ///---///
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
