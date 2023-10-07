import 'package:camera_sell_app/utils/color_and_text.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CashNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? hight;
  final double? width;
  const CashNetworkImage(
      {super.key, required this.imageUrl, this.hight, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: hight ?? 100,
        width: width ?? 133,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: customTextColor,
        size: 30,
      ),
    );
  }
}
