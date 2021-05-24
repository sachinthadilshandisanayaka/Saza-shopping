import 'package:flutter/material.dart';
import 'package:sazashopping/models/imageUploadImage.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/services/uploadImage.dart';
import 'package:sazashopping/shared/string.dart';

Future storeItemDataBase(
  BuildContext context,
  String productname,
  GlobalKey<FormState> _formKeyAddItem,
  String selectedCategory,
  Map<String, String> productCategories,
  bool genderVisibility,
  String maleOrFemale,
  List productColors,
  List productSize,
  List<Object> images,
  bool offerAvilable,
  double offer,
  double price,
  String description,
  String madeCountry,
  String brand,
  int quentity,
) async {
  List<String> imgURLS;
  DataBaseService dataBaseService = DataBaseService();

  if (_formKeyAddItem.currentState.validate()) {
    for (var image in images) {
      if (image is ImageUploadModel) {
        ImageUploadModel ium = image;
        Future<dynamic> result = await uploadImage(
          category: selectedCategory,
          allCategories: productCategories,
          file: ium,
        );
        print("=========" + result.toString());
        imgURLS.add(ium.imageUrl.toString());
      }
    }
    MainItems mainItems = new MainItems(
      name: productname,
      brand: brand,
      material: material,
      gender: genderVisibility ? maleOrFemale : '',
      description: description,
      country: madeCountry,
      quantity: quentity,
      offer: offerAvilable ? offer : 0,
      price: price.toString(),
      size: productSize.length != 0 ? productSize : [],
      images: imgURLS,
      color: productColors.length != 0 ? productColors : [],
    );
    print("--------" + mainItems.images.length.toString());
    // dynamic result = await dataBaseService.uploadItem(mainItems,
    //     selectedCategory, productCategories[selectedCategory].toString());
    // print(result.toString());
    return true;
  } else {
    return false;
  }
}
