import 'dart:io';

import 'package:camera_sell_app/utils/const_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final double? radius;
  const ImagePickerWidget({Key? key,this.radius}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _pickedImage;

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    } else {
      // User canceled the image picking.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          _pickedImage != null
              ? CircleAvatar(
                  backgroundColor: const Color.fromRGBO(72, 76, 87, 1),
                  radius: widget.radius,
                  child: ClipOval(
                    child: Image.file(
                      _pickedImage!,
                      width: 200.w,
                      height: 200.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              : CircleAvatar(
                  backgroundColor: customTextColor,
                  radius:widget.radius,
                  child: const Icon(Icons.person),
                ),
          const SizedBox(height: 20),
          Positioned(
            top: 1,
            right: 2,
            child: GestureDetector(
              onTap: _getImageFromGallery,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: const Color.fromRGBO(72, 76, 87, 1),
                child: Center(
                  child: Icon(
                    Icons.add_photo_alternate_outlined,
                    color: customTextColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
