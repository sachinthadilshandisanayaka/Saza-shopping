import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/services/fireStrore.dart';

class RetrievImageFromDataBase extends StatelessWidget {
  final String image;
  final String id;
  RetrievImageFromDataBase({@required this.image, this.id});

  Future<Widget> _getImage(
      BuildContext context, String imageName, String imageId) async {
    Image image;
    try {
      await FireStorageService.loadImage(context, imageName, imageId)
          .then((value) {
        if (value == null) {
          image = Image.asset(
            'assets/defaultImage.png',
            fit: BoxFit.scaleDown,
          );
        } else {
          image = Image.network(
            value.toString(),
            fit: BoxFit.scaleDown,
          );
        }
      });
    } catch (e) {
      image = Image.asset(
        'assets/defaultImage.png',
        fit: BoxFit.scaleDown,
      );
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
              child: CupertinoActivityIndicator(),
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
