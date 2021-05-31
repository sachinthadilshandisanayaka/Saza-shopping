import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/category.dart';
import 'package:sazashopping/screens/home/share/loadingWidget.dart';
import 'package:sazashopping/screens/home/tabBarController.dart';

class NavigateToTabBarController extends StatefulWidget {
  @override
  _NavigateToTabBarControllerState createState() =>
      _NavigateToTabBarControllerState();
}

class _NavigateToTabBarControllerState
    extends State<NavigateToTabBarController> {
  Map<String, List<String>> productSubCategory = new Map();
  List<String> productMainCategories = new List();
  @override
  Widget build(BuildContext context) {
    var result = Provider.of<List<CatogeryItems>>(context) ?? [];
    if (result.isEmpty) {
      print('no data snapshot');
      return LoadingBegin();
    } else {
      for (var category in result) {
        if (!productMainCategories.contains(category.name)) {
          productMainCategories.add(category.name);
          productSubCategory[category.name] = category.category.toList();
        }
      }
    }
    return TabBarController(
      productMainCategories: productMainCategories,
      productSubCategory: productSubCategory,
    );
  }
}
