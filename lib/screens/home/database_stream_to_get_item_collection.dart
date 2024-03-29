import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/item_collectionEmptyChecker.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/shared/widget/sharedMaskLoading.dart';

class ItemTile extends StatelessWidget {
  final String id;
  final String itemname;
  final bool connection;

  ItemTile(
      {@required this.itemname, @required this.connection, @required this.id});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MainItems>>(
      stream: DataBaseService(
            mainCategoryName: this.id,
            subCategeoryName: this.itemname,
            limit: 15,
          ).databaseStoreItemsPagination ??
          [],
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length != 0) {
            return DisplayHorizontolItemBar(
              connection: this.connection,
              id: this.id,
              itemname: this.itemname,
              mainItems: snapshot.data,
            );
          } else if (snapshot.data.length == 0) {
            return SizedBox();
          }
        }
        return SharedMaskLoading();
      },
    );
  }
}
