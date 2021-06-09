import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/thirdPage/listView.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/shared/colors.dart';

class SelectedMoreItems extends StatefulWidget {
  final String itemname;
  final String id;
  SelectedMoreItems({@required this.itemname, @required this.id});

  @override
  _SelectedMoreItemsState createState() => _SelectedMoreItemsState();
}

class _SelectedMoreItemsState extends State<SelectedMoreItems> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MainItems>>.value(
      value: DataBaseService(
              mainCategoryName: widget.id, subCategeoryName: widget.itemname)
          .databaseStoreItemsPagination,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            actions: [],
          ),
          body: ItemsListView(
            id: widget.id,
            itemname: widget.itemname,
          ),
        ),
      ),
    );
  }
}
