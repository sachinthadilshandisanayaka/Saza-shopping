import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/imageUploadImage.dart';

class ImageGetingCarView extends StatelessWidget {
  final ImageUploadModel uploadModel;
  final Function cardOnTapFuntion;
  ImageGetingCarView(
      {@required this.uploadModel, @required this.cardOnTapFuntion});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: <Widget>[
          uploadModel.imageUrl == ''
              ? Image.file(
                  File(uploadModel.imageFile.path),
                  width: 300,
                  height: 300,
                )
              : Image.network(uploadModel.imageUrl, width: 300, height: 300,
                  loadingBuilder: (context, child, progress) {
                  return progress == null
                      ? child
                      : Center(
                          child: LinearProgressIndicator(),
                        );
                }),
          Positioned(
            right: 5,
            top: 5,
            child: InkWell(
              child: Icon(
                Icons.remove_circle,
                size: 20,
                color: Colors.red,
              ),
              onTap: () => cardOnTapFuntion(),
            ),
          ),
        ],
      ),
    );
  }
}
