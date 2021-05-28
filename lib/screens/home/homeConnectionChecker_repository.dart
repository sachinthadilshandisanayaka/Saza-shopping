import 'package:flutter/material.dart';
import 'package:sazashopping/models/category.dart';
import 'package:sazashopping/screens/home/activeConnection.dart';
import 'package:sazashopping/screens/home/share/loadingWidget.dart';
import 'package:sazashopping/screens/home/share/noneConnection.dart';
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
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            {
              print('none connection');
              return ConnectionNone();
            }
            break;
          case ConnectionState.waiting:
            {
              print('waiting connection');
              return LoadingBegin();
            }
            break;
          case ConnectionState.active:
            {
              print('active');
              return navigateToHome(context: context, snapshot: snapshot);
            }
            break;
          case ConnectionState.done:
            {
              print('done connection');
              return navigateToHome(context: context, snapshot: snapshot);
            }
            break;
        }
        return LoadingBegin();
      },
    );
  }
}
