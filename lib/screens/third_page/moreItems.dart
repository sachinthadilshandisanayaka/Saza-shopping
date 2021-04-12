import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/third_page/listView.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/shared/colors.dart';

class SelectedMoreItems extends StatefulWidget {
  final String uid;
  final String itemname;
  SelectedMoreItems({@required this.uid, @required this.itemname});

  @override
  _SelectedMoreItemsState createState() => _SelectedMoreItemsState();
}

class _SelectedMoreItemsState extends State<SelectedMoreItems> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MainItems>>.value(
      value: DataBaseService(uid: widget.uid, itemtype: widget.itemname).dynamicItemlenght,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            actions: [],
          ),
          body: ItemsListView(
            uid: widget.uid,
            itemname: widget.itemname,
          ),
        ),
      ),
    );
  }
}
