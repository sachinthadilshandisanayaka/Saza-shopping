import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sazashopping/models/basket.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/adminFeatures/shared/popUpMenuButton.dart';
import 'package:sazashopping/screens/basket/basketMainFrame.dart';
import 'package:sazashopping/screens/home/share/loadingWidget.dart';
import 'package:sazashopping/screens/secondPage/itemFrame.dart';
import 'package:sazashopping/services/backetDatabase.dart';
import 'package:sazashopping/shared/colors.dart';

class SelectedItemDisplay extends StatefulWidget {
  final MainItems mainItems;
  final bool isNavigation;
  final Basket basketFromNav;
  SelectedItemDisplay({
    @required this.mainItems,
    this.isNavigation = false,
    this.basketFromNav,
  });

  @override
  _SelectedItemDisplayState createState() => _SelectedItemDisplayState();
}

class _SelectedItemDisplayState extends State<SelectedItemDisplay> {
  MainItems defualtMainItems;
  bool isLoading;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  setLoading(val) {
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingBegin()
        : SafeArea(
            top: false,
            child: WillPopScope(
              onWillPop: () async {
                Navigator.pop(context, true);
                return false;
              },
              child: Scaffold(
                backgroundColor: appBarColor,
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: appBarColor,
                  actions: <Widget>[
                    widget.isNavigation
                        ? IconButton(
                            icon: Icon(
                              FontAwesomeIcons.trashAlt,
                              size: 20,
                            ),
                            onPressed: () async {
                              setLoading(true);
                              await BasketDataBaseService(
                                      basketId: widget.basketFromNav.basketId)
                                  .deleteBasket();
                              setLoading(false);
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
                      mainItems: this.widget.mainItems,
                    ),
                  ],
                ),
                body: ItemCard(
                  mainItems: this.widget.mainItems,
                  navResult: widget.isNavigation,
                  basketFromNav: widget.basketFromNav,
                ),
              ),
            ),
          );
  }
}
