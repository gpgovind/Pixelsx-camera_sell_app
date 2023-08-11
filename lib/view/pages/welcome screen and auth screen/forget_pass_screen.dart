
import 'package:camera_sell_app/utils/const_path.dart';
import 'package:camera_sell_app/view/widgets/widget_path.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../services/forget_password.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final TextEditingController _forgetPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return backgroundColor(
        child: Scaffold(
          appBar: AppBar(
            foregroundColor:Colors.white ,
            backgroundColor:customAppBarColor ,
            centerTitle: true,
            title: customText(text: 'Forget Password',),
          ),
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                  child: Column(
            children: [
              CustomNewTextFiled(
                  hintText: 'enter email',
                  height: 80.h,
                  keyboardType: TextInputType.emailAddress,
                  controller: _forgetPasswordController),
                  const SizedBox(height: 30,),
              Card(
                elevation: 5,
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () {
                    handleForgetPassword(
                        context: context,
                        email: _forgetPasswordController.text.toString());
                  },
                  child: const CustomButton(
                      buttonName: 'confirm', hight: 77, radius: 22, width: 313),
                ),
              )
            ],
                  ),
                ),
          )),
    ));
  }
}
