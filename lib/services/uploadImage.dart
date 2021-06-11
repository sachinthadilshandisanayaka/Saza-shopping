import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:sazashopping/models/imageUploadImage.dart';
import 'package:path/path.dart' as path;

Future uploadImage(
    {@required String category,
    @required String mainCat,
    @required ImageUploadModel file}) async {
  //CollectionReference _imgRef;
  StorageReference reference = FirebaseStorage.instance
      .ref()
      .child(mainCat)
      .child(category)
      .child(path.basename(file.imageFile.path));

  StorageUploadTask uploadTask = reference.putFile(File(file.imageFile.path));
  await uploadTask.onComplete.whenComplete(() async {
    await reference.getDownloadURL().then((value) {
      file.imageUrl = value;
      return (value);
    });
  });
}
