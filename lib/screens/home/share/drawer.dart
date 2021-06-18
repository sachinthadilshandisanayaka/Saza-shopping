import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sazashopping/screens/home/menus/constants.dart';
import 'package:sazashopping/shared/colors.dart';

class DrawerShowing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            curve: Curves.bounceOut,
            decoration: BoxDecoration(
              color: appBarColor,
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'User name',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  wordSpacing: 1,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              left: 5,
            ),
            itemCount: Constants.choices.length,
            itemBuilder: (context, index) {
              dynamic icon;
              if (Constants.choices[index] == Constants.additem) {
                icon = FontAwesomeIcons.puzzlePiece;
              } else if (Constants.choices[index] == Constants.setting) {
                icon = FontAwesomeIcons.cog;
              } else if (Constants.choices[index] == Constants.orders) {
                icon = FontAwesomeIcons.dolly;
              } else if (Constants.choices[index] == Constants.purchase) {
                icon = FontAwesomeIcons.store;
              } else if (Constants.choices[index] == Constants.logout) {
                icon = FontAwesomeIcons.signOutAlt;
              } else if (Constants.choices[index] == Constants.basket) {
                icon = FontAwesomeIcons.shoppingCart;
              }
              return ListTile(
                leading: Icon(icon),
                onTap: () {},
                title: Text(
                  Constants.choices[index],
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    wordSpacing: 1,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
