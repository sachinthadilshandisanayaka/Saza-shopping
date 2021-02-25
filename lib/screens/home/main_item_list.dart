import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
// import 'package:sazashopping/screens/home/item_tile.dart';

class MainItemList extends StatefulWidget {
  @override
  _MainItemListState createState() => _MainItemListState();
}

class _MainItemListState extends State<MainItemList> {
  @override
  Widget build(BuildContext context) {
    final shopItems = Provider.of<List<MainItems>>(context);
    print(shopItems);

    return Container();
    // ListView.builder(
    //   itemCount: shopItems.length,
    //   itemBuilder: (context, index) {
    //     return ItemTile(items: shopItems[index]);
    //   },
    // );
  }
}
