import 'package:flutter/material.dart';
import 'package:sazashopping/models/category.dart';
import 'package:sazashopping/screens/home/loadingWidget.dart';
import 'package:sazashopping/screens/home/tabBarController.dart';
import 'package:sazashopping/services/categoryCollection.dart';

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  Map<String, List<String>> productSubCategory = new Map();
  List<String> productMainCategories = new List();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CatogeryItems>>(
        stream: CategoryDataBaseService().catogories,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingBegin();
          } else {
            for (var category in snapshot.data) {
              if (!productMainCategories.contains(category.name)) {
                productMainCategories.add(category.name);
                productSubCategory[category.name] = category.category.toList();
                for (var i in category.category) {
                  print(i.toString());
                }
              }
            }
          }
          return tabBarController(
              productMainCategories: productMainCategories,
              productSubCategory: productSubCategory,
              context: context);
        });
  }
}
