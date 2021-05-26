import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/home.dart';
import 'package:sazashopping/screens/home/home_title.dart';
import 'package:sazashopping/screens/home/share/popUpButoon.dart';
import 'package:sazashopping/shared/colors.dart';

Widget tabBarController(
    {@required Map<String, List<String>> productSubCategory,
    @required List<String> productMainCategories,
    BuildContext context}) {
  return DefaultTabController(
    length: productMainCategories.length,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        centerTitle: true,
        title: HomeTitle(),
        actions: <Widget>[
          popUpMenuButton(context),
        ],
        bottom: TabBar(
          physics: BouncingScrollPhysics(),
          isScrollable: true,
          indicatorWeight: 6.0,
          indicatorColor: Colors.white,
          tabs: productMainCategories.map<Widget>((String mainCategory) {
            return Tab(
              child: Text(mainCategory),
            );
          }).toList(),
        ),
      ),
      drawer: Drawer(),
      body: TabBarView(
        children: productMainCategories.map((String mainCategory) {
          return Home(
            connected: true,
            id: mainCategory,
            subItems: productSubCategory[mainCategory],
          );
        }).toList(),
      ),
    ),
  );
}
