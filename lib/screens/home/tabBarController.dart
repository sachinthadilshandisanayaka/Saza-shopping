import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/home.dart';
import 'package:sazashopping/screens/home/home_title.dart';
import 'package:sazashopping/screens/home/share/popUpButoon.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/testStyles.dart';
import 'package:sazashopping/shared/widget/display_text_withStyle.dart';

class TabBarController extends StatelessWidget {
  final Map<String, List<String>> productSubCategory;
  final List<String> productMainCategories;
  TabBarController(
      {@required this.productSubCategory, this.productMainCategories});

  @override
  Widget build(BuildContext context) {
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
                child: diplayTextWithStyle(
                  text: mainCategory,
                  style: tabBarHeaderNameStyle,
                ),
              );
            }).toList(),
          ),
        ),
        drawer: Drawer(),
        body: TabBarView(
          children: productMainCategories.map((String mainCategory) {
            return Home(
              connetion: true,
              id: mainCategory,
              subItems: productSubCategory[mainCategory],
            );
          }).toList(),
        ),
      ),
    );
  }
}
