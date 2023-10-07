import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/const_path.dart';

class ImagePickerAdminSide extends ConsumerStatefulWidget {
  final double? radius;

  const ImagePickerAdminSide({
    Key? key,
    this.radius,
  }) : super(key: key);

  @override
  ConsumerState<ImagePickerAdminSide> createState() =>
      _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends ConsumerState<ImagePickerAdminSide> {
  File? pickedImage;

  Future<void> getImageFromGallery() async {
    final product = ref.watch(productProvider);
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
        product.productPickedImage = pickedImage;
      });
    } else {
      // User canceled the image picking.
    }
  }

  @override
  void dispose() {
    pickedImage = null;
    final product = ref.watch(productProvider);
    product.productPickedImage = null;
    log(product.productPickedImage.toString());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productProvider);
    log(product.productPickedImage.toString());

    return Center(
      child: Stack(
        children: <Widget>[
          pickedImage != null
              ? CircleAvatar(
                  backgroundColor: const Color.fromRGBO(72, 76, 87, 1),
                  radius: widget.radius,
                  child: ClipOval(
                    child: Image.file(
                      pickedImage!,
                      width: 200.w,
                      height: 200.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              : CircleAvatar(
                  backgroundColor: const Color.fromRGBO(72, 76, 87, 1),
                  radius: widget.radius,
                  child: const Icon(Icons.add_a_photo_outlined,color: Colors.white,)),
          const SizedBox(height: 20),
          Positioned(
            top: 1,
            right: 2,
            child: GestureDetector(
              onTap: () => getImageFromGallery(),
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
