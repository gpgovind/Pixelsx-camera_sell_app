import 'package:camera_sell_app/utils/background_color.dart';
import 'package:camera_sell_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/profile_textfiled.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundColor(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                height: 5.sh,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 130, vertical: 40),
                      child: CircleAvatar(
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
                    ),
                    Column(
                      children: [
                        ProfileTextFiled(
                          text: 'Name',
                          height: 75.h,
                          hintText: 'Rasna',
                          keyboardType: TextInputType.name,
                          controller: nameController,
                        ),
                        ProfileTextFiled(
                          text: 'last name',
                          height: 75.h,
                          hintText: 'ck',
                          keyboardType: TextInputType.name,
                          controller: nameController,
                        ),
                        ProfileTextFiled(
                          text: 'Phone number',
                          height: 75.h,
                          hintText: '993451359',
                          keyboardType: TextInputType.name,
                          controller: nameController,
                        ),
                        ProfileTextFiled(
                          text: 'email',
                          height: 75.h,
                          hintText: 'rasnack@gmail.com',
                          keyboardType: TextInputType.name,
                          controller: nameController,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Card(
                          elevation: 5,
                          color: Colors.transparent,
                          child: CustomButton(
                              buttonName: 'submit',
                              hight: 77,
                              radius: 22,
                              width: 313),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ))));
  }
}

// const EdgeInsets.symmetric(vertical: 40,horizontal: 120),