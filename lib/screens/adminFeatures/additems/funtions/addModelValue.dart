import 'package:flutter/material.dart';
import 'package:sazashopping/models/imageUploadImage.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/services/uploadImage.dart';

Future storeItemDataBase(
  String productname,
  String material,
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
  List<String> imgURLS = new List();
  DataBaseService dataBaseService = DataBaseService();

  if (_formKeyAddItem.currentState.validate()) {
    for (var image in images) {
      if (image is ImageUploadModel) {
        ImageUploadModel ium = image;
        await uploadImage(
          category: selectedCategory,
          mainCat: productCategories[selectedCategory],
          file: ium,
        );
        imgURLS.add(ium.imageUrl.toString());
      }
    }

    MainItems mainItems = MainItems(
      name: productname ?? '',
      brand: brand ?? '',
      material: material ?? '',
      gender: genderVisibility ? maleOrFemale : '',
      description: description ?? '',
      country: madeCountry ?? '',
      quantity: quentity ?? 0,
      offer: offerAvilable ? offer : 0.0,
      price: price.toString() ?? '',
      size: productSize.length != 0 ? productSize : [],
      images: imgURLS ?? [],
      color: productColors.length != 0 ? productColors : [],
    );

    print("--------" + mainItems.name.toString());

    dynamic result = await dataBaseService.uploadItem(mainItems,
        selectedCategory, productCategories[selectedCategory].toString());

    print("result :" + result.toString());

    return true;
  }
}
