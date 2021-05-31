import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/main_item_list.dart';
import 'package:sazashopping/services/database.dart';

class Home extends StatefulWidget {
  final bool connected;
  final String id;
  final List<String> subItems;
  Home({this.connected, @required this.id, @required this.subItems});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> newSubItems = new List();

  @override
  void initState() {
    super.initState();
    for (var i in widget.subItems) {
      itemLenght(widget.id, i).listen((data) {
        if (data.length != 0) {
          setState(() {
            newSubItems.add(i);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainItemList(
      connetion: widget.connected,
      id: widget.id,
      subItems: widget.subItems,
    );
  }
}

Stream<List<MainItems>> itemLenght(String categoryName, String subCatName) {
  Stream<List<MainItems>> itemsStream = DataBaseService(
        mainCategoryName: categoryName,
        subCategeoryName: subCatName,
      ).databaseStoreAllItems ??
      [];
  return itemsStream;
}
