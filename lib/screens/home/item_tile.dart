import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
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
    return StreamProvider<List<MainItems>>.value(
      value: DataBaseService().dynamicItem,
      
    );
  }
}
