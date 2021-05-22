import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/imageUploadImage.dart';

Widget buildCardView({
  @required ImageUploadModel uploadModel,
  @required Function cardOnTapFuntion,
}) {
  return Card(
    clipBehavior: Clip.antiAlias,
    child: Stack(
      children: <Widget>[
        Image.file(
          File(uploadModel.imageFile.path),
          width: 300,
          height: 300,
        ),
        Positioned(
          right: 5,
          top: 5,
          child: InkWell(
            child: Icon(
              Icons.remove_circle,
              size: 20,
              color: Colors.red,
            ),
            onTap: () => cardOnTapFuntion()
            // setState(
            //   () {
            //     images.replaceRange(index, index + 1, ['Add Image']);
            //   },
            // );
            ,
          ),
        ),
      ],
    ),
  );
}
