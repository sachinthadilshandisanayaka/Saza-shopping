import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/adminFeatures/shared/popUpMenuButton.dart';
import 'package:sazashopping/screens/basket/basketMainFrame.dart';
import 'package:sazashopping/screens/secondPage/itemFrame.dart';
import 'package:sazashopping/shared/colors.dart';

class SelectedItemDisplay extends StatefulWidget {
  final MainItems mainItems;
  SelectedItemDisplay({@required this.mainItems});

  @override
  _SelectedItemDisplayState createState() => _SelectedItemDisplayState();
}

class _SelectedItemDisplayState extends State<SelectedItemDisplay> {
  bool navboolresult = false;
  MainItems defualtMainItems;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              Container(
                margin: EdgeInsets.only(right: 1),
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.shoppingCart,
                    size: 20,
                  ),
                  onPressed: () async {
                    MainItems navResult = await Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => BasketFrame(),
                      ),
                    );
                    if (navResult != null) {
                      setState(() {
                        defualtMainItems = navResult;
                        navboolresult = true;
                      });
                    }
                  },
                ),
              ),
              AdminPopupMenu(
                mainItems: this.widget.mainItems,
              ),
            ],
          ),
          body: ItemCard(
            mainItems: defualtMainItems ?? this.widget.mainItems,
            navResult: this.navboolresult,
          ),
        ),
      ),
    );
  }
}
