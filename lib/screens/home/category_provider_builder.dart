import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/category.dart';
import 'package:sazashopping/screens/home/share/loadingWidget.dart';
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
  Widget build(BuildContext context) {
    if (!widget.snapshot.hasData) {
      print('no data snapshot');
      return LoadingBegin();
    } else if (widget.snapshot.hasError) {
      return Container(
        child: Text('Error'),
      );
    } else {
      for (var category in widget.snapshot.data) {
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
