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
      value: DataBaseService(uid: user.uid, itemtype: itemname).dynamicItem,
      child: Material(
        color: backgroudColor, // here
        elevation: 0,
        shadowColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
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
      children: <Widget>[
        Text(
          itemname.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Baloo2',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        Text(
          'MORE',
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
