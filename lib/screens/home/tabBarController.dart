import 'package:flutter/material.dart';
import 'package:sazashopping/models/category.dart';
import 'package:sazashopping/screens/basket/basketMainFrame.dart';
import 'package:sazashopping/screens/home/home.dart';
import 'package:sazashopping/screens/home/searchBar/searchDelegate.dart';
import 'package:sazashopping/screens/home/share/drawer.dart';
// import 'package:sazashopping/screens/home/share/popUpButoon.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/testStyles.dart';
import 'package:sazashopping/shared/widget/display_text_withStyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabBarController extends StatelessWidget {
  final List<CatogeryItems> snapshotData;
  TabBarController({
    this.snapshotData,
  });
  final scaffoled = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: snapshotData.length,
      child: Scaffold(
        key: scaffoled,
        appBar: AppBar(
          backgroundColor: appBarColor,
          elevation: 0,
          centerTitle: true,
          // title: HomeTitle(),
          leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.alignLeft,
              size: 20,
            ),
            onPressed: () {
              scaffoled.currentState.openDrawer();
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.search,
                size: 20,
              ),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.shoppingCart,
                size: 20,
              ),
              onPressed: () async {
                await Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => BasketFrame()));
              },
            ),
            // popUpMenuButton(context),
          ],
          bottom: TabBar(
            physics: BouncingScrollPhysics(),
            isScrollable: true,
            indicatorWeight: 6.0,
            indicatorColor: Colors.white,
            tabs: snapshotData.map<Widget>((CatogeryItems catogeryItems) {
              return Tab(
                child: diplayTextWithStyle(
                  text: catogeryItems.name.toString(),
                  style: tabBarHeaderNameStyle,
                ),
              );
            }).toList(),
          ),
        ),
        drawer: DrawerShowing(),
        body: TabBarView(
          children: snapshotData.map((CatogeryItems catogeryItems) {
            return Home(
              connetion: true,
              id: catogeryItems.name.toString(),
              subItems: catogeryItems.category,
            );
          }).toList(),
        ),
      ),
    );
  }
}
