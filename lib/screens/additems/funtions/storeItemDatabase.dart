import 'package:flutter/material.dart';
import 'package:sazashopping/models/imageUploadImage.dart';

void storeItemDataBase(
    BuildContext context,
    GlobalKey<FormState> _formKeyAddItem,
    String selectedCategory,
    bool genderVisibility,
    String maleOrFemale,
    List productColors,
    List productSize,
    List<Object> images) {
  if (_formKeyAddItem.currentState.validate()) {
    print('form valid');
    if (selectedCategory != null || selectedCategory != '') {
      print('category valid');
      if (genderVisibility == true && maleOrFemale.isNotEmpty) {
        print('gender ok');
        if (productColors.length != 0) {
          for (var i in productColors) {
            print(i.toString());
          }
          print('Colors selected');
          if (productSize.length != 0) {
            print("product selected");
            for (var image in images) {
              if (image is ImageUploadModel) {
                ImageUploadModel ium = image;
                print(ium.imageFile.path.toString());
              }
            }
          }
        }
      }
    }
  }
}
