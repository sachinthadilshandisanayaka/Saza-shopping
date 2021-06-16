import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sazashopping/models/basket.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/adminFeatures/shared/popUpMenuButton.dart';
import 'package:sazashopping/screens/basket/basketMainFrame.dart';
import 'package:sazashopping/screens/secondPage/itemFrame.dart';
import 'package:sazashopping/services/backetDatabase.dart';
import 'package:sazashopping/shared/colors.dart';

class SelectedItemDisplay extends StatelessWidget {
  final MainItems mainItems;
  final bool isNavigation;
  final Basket basketFromNav;
  SelectedItemDisplay({
    @required this.mainItems,
    this.isNavigation = false,
    this.basketFromNav,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context, 'normal');
            return false;
          },
          child: Scaffold(
            backgroundColor: appBarColor,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: appBarColor,
              actions: <Widget>[
                this.isNavigation
                    ? IconButton(
                        icon: Icon(
                          FontAwesomeIcons.trashAlt,
                          size: 20,
                        ),
                        onPressed: () async {
                          await BasketDataBaseService(
                                  basketId: this.basketFromNav.basketId)
                              .deleteBasket();

                          Navigator.pop(context, 'deletebasket');
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          FontAwesomeIcons.shoppingCart,
                          size: 20,
                        ),
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => BasketFrame()));
                        },
                      ),
                AdminPopupMenu(
                  mainItems: this.mainItems,
                ),
              ],
            ),
            body: ItemCard(
              mainItems: this.mainItems,
              navResult: isNavigation,
              basketFromNav: basketFromNav,
            ),
          ),
        ),
      ),
    );
  }
}
