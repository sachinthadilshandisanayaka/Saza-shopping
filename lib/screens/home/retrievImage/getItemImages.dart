import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/services/fireStrore.dart';

class RetrievImageFromDataBase extends StatelessWidget {
  final String image;
  final String id;
  RetrievImageFromDataBase({@required this.image, this.id});

  _getDefaultImage() {
    return Image.asset(
      'assets/defaultImage.png',
      fit: BoxFit.scaleDown,
    );
  }

  Future<Widget> _getImage(
      BuildContext context, String imageName, String imageId) async {
    Image image;
    try {
      await FireStorageService.loadImage(context, imageName, imageId)
          .then((value) {
        if (value == null) {
          image = _getDefaultImage();
        } else {
          image = Image.network(
            value.toString(),
            loadingBuilder: (context, child, progress) {
              return progress == null ? child : LinearProgressIndicator();
            },
            fit: BoxFit.scaleDown,
          );
        }
      });
    } catch (e) {
      image = _getDefaultImage();
    }
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getImage(context, this.image, this.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return FittedBox(
            fit: BoxFit.contain,
            child: snapshot.data,
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: _getDefaultImage(),
            ),
          );
        }
        return FittedBox(
          fit: BoxFit.fill,
        );
      },
    );
  }
}
