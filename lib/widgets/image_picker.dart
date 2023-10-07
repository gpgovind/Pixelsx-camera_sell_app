import 'dart:developer';
import 'dart:io';
import 'package:camera_sell_app/utils/const_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends ConsumerStatefulWidget {
  final double? radius;
  final String? imageUrl;

  const ImagePickerWidget({Key? key, this.radius, this.imageUrl})
      : super(key: key);

  @override
  ConsumerState<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends ConsumerState<ImagePickerWidget> {
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
                  backgroundImage: FileImage(pickedImage!),
                  radius: widget.radius,
                )
              : CircleAvatar(
                  backgroundColor: const Color.fromRGBO(72, 76, 87, 1),
                  radius: widget.radius,
                  child: widget.imageUrl!.isEmpty
                      ? const Icon(Icons.person_2_rounded)
                      : CircleAvatar(
                          backgroundColor: const Color.fromRGBO(72, 76, 87, 1),
                          backgroundImage: NetworkImage(widget.imageUrl!),
                          radius: widget.radius,
                        )),
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
