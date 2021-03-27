import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
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
  ScrollController _scrollController = ScrollController();

  List<MainItems> getListItems;

  int loadedDataLenght = 10;

  bool moreDataAvalible = true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (moreDataAvalible) {
          _getMoreData();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  _getMoreData() {
    setState(() {
      loadedDataLenght += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    final allShopItems = Provider.of<List<MainItems>>(context) ?? [];
    final itemDisplayMaxLenght = allShopItems.length;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          actions: [],
        ),
        body: StreamBuilder<Object>(
            stream: DataBaseService(
                        uid: widget.uid,
                        itemtype: widget.itemname,
                        limit: loadedDataLenght)
                    .dynamicItem ??
                [],
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                getListItems = snapshot.data;
                return Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: getListItems.length + 1,
                    itemBuilder: (context, index) {
                      if (itemDisplayMaxLenght == index) {
                        return Container(
                            child: Center(
                          child: Text('No items'),
                        ));
                      }
                      return Container(
                        child: Text(
                          getListItems[index].toString(),
                        ),
                      );
                    },
                  ),
                );
              }
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }),
      ),
    );
  }
}
