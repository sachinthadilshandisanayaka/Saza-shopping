import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:sazashopping/models/imageUploadImage.dart';
import 'package:path/path.dart' as path;

Future uploadImage(
    {@required String category,
    @required Map<String, String> allCategories,
    @required ImageUploadModel file}) async {
  //CollectionReference _imgRef;
  StorageReference reference = FirebaseStorage.instance
      .ref()
      .child(allCategories[category])
      .child(category)
      .child(path.basename(file.imageFile.path));

  StorageUploadTask uploadTask = reference.putFile(File(file.imageFile.path));
  await uploadTask.onComplete.whenComplete(() async {
    await reference.getDownloadURL().then((value) {
      file.imageUrl = value;
      return (true);
    });
  });
}
