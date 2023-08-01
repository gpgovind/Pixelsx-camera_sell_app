import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ProfileTextFiled extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  final double height;
  final double width;
  final String text;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  ProfileTextFiled(
      {super.key,
      required this.text,
      this.width=360,
      required this.hintText,
      required this.height,
      required this.keyboardType,
      this.obscureText = false,
      required this.controller});

  @override
  State<ProfileTextFiled> createState() => _ProfileTextFiledState();
}

class _ProfileTextFiledState extends State<ProfileTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
   
      children: [
         Container(
            margin: const EdgeInsets.all(5),
           child: Text(widget.text,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.white
              )),
         ),
        
        Container(
          width: widget.width.w ,
          height:widget.height ,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: const Color(0x356b7180),
          ),
          child: Center(
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
