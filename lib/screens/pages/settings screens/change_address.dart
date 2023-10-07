import 'dart:developer';

import 'package:camera_sell_app/data/user_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/widget_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/const_path.dart';

class ChangeAddress extends ConsumerStatefulWidget {
  const ChangeAddress({super.key});

  @override
  ConsumerState<ChangeAddress> createState() => _ChangeAddressState();
}

class _ChangeAddressState extends ConsumerState<ChangeAddress> {
  final nameController = TextEditingController();
  final countryController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    phoneNumberController.dispose();
    countryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userDetails = ref.watch(userCurrentDetails);
    final update = ref.watch(userProvider);
    return backgroundColor(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: userDetails.when(
                data: (userData) {
                  final user = userData!.data() as Map<String, dynamic>;
                  log(userData.id.toString());

                  final userName = user['name'];
                  final userCity = user['city'];
                  final userAddress = user['address'];
                  final userEmail = user['email'];
                  final userImage = user['imageUrl'];

                  log(userAddress);

                  final phoneNumber = user['phoneNumber'];
                  return SafeArea(
                      child: SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      height: 5.sh,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 130, vertical: 40),
                            child: const Text("Address",
                                style: TextStyle(
                                    fontSize: 25.519121170043945,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomNewTextFiled(
                                    text: 'city',
                                    height: 75.h,
                                    width: 170,
                                    hintText: userCity == 'empty'
                                        ? 'enter city'
                                        : userCity,
                                    keyboardType: TextInputType.name,
                                    controller: cityController,
                                  ),
                                  CustomNewTextFiled(
                                    text: 'country',
                                    height: 75.h,
                                    width: 170,
                                    hintText: 'india',
                                    keyboardType: TextInputType.text,
                                    controller: countryController,
                                    enabled: false,
                                  ),
                                ],
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
                              CustomNewTextFiled(
                                text: 'Address',
                                height: 75.h,
                                hintText: userAddress == 'empty'
                                    ? ' enter address'
                                    : userAddress,
                                keyboardType: TextInputType.streetAddress,
                                controller: addressController,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              InkWell(
                                onTap: () async {
                                  EasyLoading.show(
                                      maskType: EasyLoadingMaskType.clear,
                                      indicator: esLoading());
                                  await update
                                      .updateUserAddress(
                                          user: UserModel(
                                              address:
                                                  addressController.text.isEmpty
                                                      ? userAddress
                                                      : addressController.text,
                                              city: cityController.text.isEmpty
                                                  ? userCity
                                                  : cityController.text,
                                              email: userEmail,
                                              image: userImage,
                                              name: nameController.text.isEmpty
                                                  ? userName
                                                  : nameController.text,
                                              phoneNumber: phoneNumberController
                                                      .text.isEmpty
                                                  ? phoneNumber
                                                  : phoneNumberController.text))
                                      .whenComplete(() {
                                    EasyLoading.dismiss();
                                  });
                                },
                                child: const Card(
                                  elevation: 5,
                                  color: Colors.transparent,
                                  child: CustomButton(
                                      buttonName: 'Save Address',
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
                loading: loading)));
  }
}
