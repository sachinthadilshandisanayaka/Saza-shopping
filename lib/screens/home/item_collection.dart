import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/item_collectionEmptyChecker.dart';
import 'package:sazashopping/services/database.dart';

class ItemTile extends StatelessWidget {
  final String id;
  final String itemname;
  final bool connection;

  ItemTile(
      {@required this.itemname, @required this.connection, @required this.id});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MainItems>>.value(
      value: DataBaseService(
              mainCategoryName: this.id, subCategeoryName: this.itemname)
          .databaseStoreAllItems,
      child: ItemCollectionEmptyCheck(
        connection: this.connection,
        id: this.id,
        itemname: this.itemname,
      ),
    );
  }
}
