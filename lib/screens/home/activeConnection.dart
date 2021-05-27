import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/share/loadingWidget.dart';
import 'package:sazashopping/screens/home/tabBarController.dart';

Widget navigateToHome(
    {@required AsyncSnapshot snapshot, @required BuildContext context}) {
  Map<String, List<String>> productSubCategory = new Map();
  List<String> productMainCategories = new List();
  if (!snapshot.hasData) {
    print('no data snaphot');
    return LoadingBegin();
  } else {
    for (var category in snapshot.data) {
      if (!productMainCategories.contains(category.name)) {
        productMainCategories.add(category.name);
        productSubCategory[category.name] = category.category.toList();
      }
    }
  }
  return tabBarController(
      productMainCategories: productMainCategories,
      productSubCategory: productSubCategory,
      context: context);
}
