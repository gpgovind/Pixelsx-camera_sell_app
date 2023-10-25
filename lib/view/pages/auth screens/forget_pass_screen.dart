import 'package:camera_sell_app/utils/const_path.dart';
import 'package:camera_sell_app/widgets/widget_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ForgetPassScreen extends ConsumerStatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  ConsumerState<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends ConsumerState<ForgetPassScreen> {
  final TextEditingController _forgetPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _forgetPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authenticationProvider);
    return backgroundColor(
        child: Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: customAppBarColor,
        centerTitle: true,
        title: customText(
          text: 'Forget Password',
        ),
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
              const SizedBox(
                height: 30,
              ),
              Card(
                elevation: 5,
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () async {
                    auth.handleForgetPassword(
                        email: _forgetPasswordController.text);
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
