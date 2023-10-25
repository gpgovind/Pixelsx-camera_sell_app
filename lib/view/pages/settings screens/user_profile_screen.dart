import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/const_path.dart';
import '../../../widgets/widget_path.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({super.key});

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userDetails = ref.watch(userCurrentDetails);
    final update = ref.watch(userProvider);
    final upload = ref.watch(productProvider);
    return backgroundColor(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                'profile',
                style: TextStyle(color: customTextColor),
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              foregroundColor: Colors.white,
            ),
            body: userDetails.when(
              data: (userData) {
                final user = userData!.data() as Map<String, dynamic>;
                log(userData.id.toString());

                final userImage = user['imageUrl'];
                final userName = user['name'];

                final phoneNumber = user['phoneNumber'];
                return SafeArea(
                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90).r,
                    child: Column(
                      children: [
                        ImagePickerWidget(
                          radius: 80.r,
                          imageUrl: userImage,
                        ),
                        Column(
                          children: [
                            CustomNewTextFiled(
                              text: 'Name',
                              height: 75.h,
                              hintText: userName,
                              keyboardType: TextInputType.name,
                              controller: nameController,
                            ),
                            CustomNewTextFiled(
                              text: 'Phone number',
                              height: 75.h,
                              hintText: phoneNumber == 'empty'
                                  ? 'please enter number'
                                  : phoneNumber,
                              keyboardType: TextInputType.number,
                              controller: phoneNumberController,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                              onTap: () async {
                                EasyLoading.show(
                                    maskType: EasyLoadingMaskType.clear,
                                    indicator:
                                        const CircularProgressIndicator());
                                if (upload.productPickedImage != null) {
                                  await upload.uploadImageToFirebase(
                                      upload.productPickedImage);
                                }
                                final updatedName = nameController.text.isEmpty
                                    ? userName.toString()
                                    : nameController.text;
                                final updatedPhoneNumber =
                                    phoneNumberController.text.isEmpty
                                        ? phoneNumber.toString()
                                        : phoneNumberController.text;
                                final updatedImage =
                                    upload.productImageUrl ?? userImage;

                                await update
                                    .updateUserData(
                                  name: updatedName,
                                  phoneNumber: updatedPhoneNumber,
                                  image: updatedImage,
                                )
                                    .whenComplete(() {
                                  EasyLoading.dismiss();
                                  CustomNavigator.navigationPop(
                                      context: context);
                                });
                              },
                              child: const Card(
                                elevation: 5,
                                color: Colors.transparent,
                                child: CustomButton(
                                    buttonName: 'submit',
                                    hight: 77,
                                    radius: 22,
                                    width: 313),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ));
              },
              error: (error, stackTrace) => loading(),
              loading: () => loading(),
            )));
  }
}
