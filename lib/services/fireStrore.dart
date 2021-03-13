import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(
      BuildContext context, String image, String id) async {
    print("Result " + image + id);
    if (image.isEmpty || image == null) {
      return null;
    }
    return await FirebaseStorage.instance
        .ref()
        .child('sellItems')
        .child(id)
        .child(image)
        .getDownloadURL();
  }
}
