import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';

class MainItemList extends StatefulWidget {
  @override
  _MainItemListState createState() => _MainItemListState();
}

class _MainItemListState extends State<MainItemList> {
  @override
  Widget build(BuildContext context) {
    final mainItemList = Provider.of<List<MainItems>>(context);
    // print(mainItemList);
    print(mainItemList);

    return Container();
  }
}
