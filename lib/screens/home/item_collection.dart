import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/models/user.dart';
import 'package:sazashopping/screens/home/catogeries/catogery_horizontal_line.dart';
import 'package:sazashopping/services/database.dart';

class ItemTile extends StatefulWidget {
  final String itemname;

  ItemTile({this.itemname});

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return StreamProvider<List<MainItems>>.value(
      value:
          DataBaseService(uid: user.uid, itemtype: widget.itemname).dynamicItem,
      child: Material(
        color: Colors.white,
          elevation: 5,
          shadowColor: Colors.black,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: labelTopItem(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                  top: 10,
                  left: 5,
                  right: 5,
                ),
                child: CatogeriesHorizontalTile(),
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
        Text(widget.itemname),
        Text(
          'MORE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
