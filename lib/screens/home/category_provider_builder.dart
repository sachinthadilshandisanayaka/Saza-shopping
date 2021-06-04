import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/tabBarController.dart';

class NavigateToTabBarController extends StatefulWidget {
  final AsyncSnapshot snapshot;
  NavigateToTabBarController({@required this.snapshot});
  @override
  _NavigateToTabBarControllerState createState() =>
      _NavigateToTabBarControllerState();
}

class _NavigateToTabBarControllerState
    extends State<NavigateToTabBarController> {
  Map<String, List<String>> productSubCategory = new Map();
  List<String> productMainCategories = new List();

  @override
  void initState() {
    super.initState();
    setState(() {
      for (var category in widget.snapshot.data) {
        if (!productMainCategories.contains(category.name)) {
          productMainCategories.add(category.name);
          productSubCategory[category.name] = category.category.toList();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBarController(
      productMainCategories: productMainCategories,
      productSubCategory: productSubCategory,
    );
  }
}
