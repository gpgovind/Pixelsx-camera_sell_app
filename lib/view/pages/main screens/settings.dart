import 'dart:developer';
import 'package:camera_sell_app/view/pages/settings%20screens/about_screen.dart';
import 'package:camera_sell_app/view/pages/settings%20screens/privacy_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/const_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../settings screens/change_address.dart';
import '../settings screens/order_details_screen.dart';
import '../settings screens/user_profile_screen.dart';
import '../../../widgets/widget_path.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  bool _isAdmin = false;

  @override
  void initState() {
    super.initState();
    _checkAdminStatus(context);
  }

  void _checkAdminStatus(BuildContext context) async {
    try {
      User? user = auth.currentUser;

      if (user != null) {
        //  admin's email address
        log('${user.uid.toString()} user');
        if (user.email == "gp@gmail.com") {
          setState(() {
            _isAdmin = true;
          });
        }
      }
    } catch (e) {
      // Handle any errors here
      log("Error checking admin status: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authenticationProvider);
    final userDetails = ref.watch(userCurrentDetails);

    return backgroundColor(
        child: SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.h),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.w,
                  ),
                  child: userDetails.when(
                    data: (userData) {
                      final user = userData!.data() as Map<String, dynamic>;
                      log(userData.id.toString());

                      final userImage = user['imageUrl'];
                      final userName = user['name'];
                      final userEmail = user['email'];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              radius: 60.r,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: userImage != ''
                                    ? CircleAvatar(
                                        radius: 60,
                                        backgroundImage:
                                            NetworkImage(userImage),
                                      )
                                    : const Icon(
                                        Icons.person_outline_outlined,
                                        color: Colors.black,
                                      ),
                              )),
                          Column(
                            children: [
                              Text(userName,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                              Text(userEmail,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))
                            ],
                          )
                        ],
                      );
                    },
                    error: (error, stackTrace) => const Center(
                        child: Text(
                      'error',
                      style: TextStyle(color: Colors.white),
                    )),
                    loading: () => const CircularProgressIndicator(),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      isAdmin(_isAdmin, context),

                      ///---//
                      ListTile(
                        leading: const Icon(
                          Icons.person_3_outlined,
                          color: Colors.white,
                        ),
                        onTap: () {
                          CustomNavigator.navigationPush(
                              context: context,
                              child: const UserProfileScreen());
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

                      ///---///
                      const Divider(
                        color: Colors.white,
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.wallet,
                          color: Colors.white,
                        ),
                        onTap: () {
                          CustomNavigator.navigationPush(
                              context: context,
                              child: const OrderDetailsScreen());
                        },
                        title: const Text("Order Info",
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
                        leading: Icon(
                          Icons.policy_outlined,
                          color: Colors.white,
                        ),
                        onTap: () {
                          CustomNavigator.navigationPush(
                              context: context, child: PrivacyScreen());
                        },
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
                      ListTile(
                        leading: Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                        onTap: () {
                          CustomNavigator.navigationPush(
                              context: context, child: AboutScreen());
                        },
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
                          showConformationMessage(
                              context: context,
                              onPressed: () async {
                                await auth.signUserOut(context);
                              });
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
                  )),
                ),
              ),
            ],
          )),
    ));
  }
}

Widget isAdmin(isAdmin, context) {
  if (isAdmin) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            CustomNavigator.navigationPush(
                context: context, child: const NewCustomizations());
          },
          leading: const Icon(
            Icons.admin_panel_settings_outlined,
            color: Colors.white,
          ),
          title: const Text("Admin",
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
        )
      ],
    );
  } else {
    return Container();
  }
}
