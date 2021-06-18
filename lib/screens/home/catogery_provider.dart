import 'package:flutter/material.dart';
import 'package:sazashopping/models/category.dart';
import 'package:sazashopping/screens/home/tabBarController.dart';
import 'package:sazashopping/services/categoryCollection.dart';
import 'package:sazashopping/shared/loading.dart';

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CatogeryItems>>(
      stream: CategoryDataBaseService().catogories,
      builder: (context, snapshot) {
        // if (snapshot.connectionState == ConnectionState.active) {
        if (snapshot.hasData) {
          return TabBarController(
            snapshotData: snapshot.data,
          );
        } else if (snapshot.hasError) {
          return Container(
            child: Text('Error'),
          );
        }
        // }
        return Loading();
      },
    );
  }
}
