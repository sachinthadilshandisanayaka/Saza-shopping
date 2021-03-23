import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/models/user.dart';
import 'package:sazashopping/screens/home/catogeries/catogery_horizontal_line.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/shared/colors.dart';

class ItemTile extends StatelessWidget {
  final String itemname;

  ItemTile({this.itemname});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return StreamProvider<List<MainItems>>.value(
      value:
          DataBaseService(uid: user.uid, itemtype: itemname).dynamicItemlenght,
      child: Material(
        color: backgroudColor, // here
        elevation: 0,
        shadowColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, right: 0),
              child: labelTopItem(),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: CatogeriesHorizontalTile(type: itemname, uid: user.uid),
            ),
          ],
        ),
      ),
    );
  }

  Widget labelTopItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          itemname.toUpperCase(),
          style: TextStyle(
            fontFamily: 'CormorantGaramond',
            fontSize: 22,
            color: appBarColor,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: itemShadowColor,
                blurRadius: 8,
                offset: Offset(0, 4),
              )
            ],
            letterSpacing: 1,
          ),
        ),
        TextButton(
          onPressed: () {
            print('selected');
          },
          child: Row(
            children: [
              Text(
                'MORE',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_right),
            ],
          ),
          style: TextButton.styleFrom(primary: Colors.black),
        ),
      ],
    );
  }
}
