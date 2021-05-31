import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/category.dart';
import 'package:sazashopping/screens/home/category_provider_builder.dart';
import 'package:sazashopping/services/categoryCollection.dart';

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CatogeryItems>>.value(
      value: CategoryDataBaseService().catogories,
      child: NavigateToTabBarController(),
    );
  }
}
