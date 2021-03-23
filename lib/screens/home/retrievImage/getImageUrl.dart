import 'package:flutter/material.dart';
import 'package:sazashopping/services/fireStrore.dart';

getDefaultImage() {
  return 'assets/defaultImage.png';
  // fit: BoxFit.scaleDown,
}

Future<String> getImageUrl(
    BuildContext context, String imageName, String imageId) async {
  String image;
  try {
    await FireStorageService.loadImage(context, imageName, imageId)
        .then((value) {
      if (value == null) {
        image = getDefaultImage();
      } else {
        image = value.toString();
      }
    });
  } catch (e) {
    image = getDefaultImage();
  }
  return image;
}
