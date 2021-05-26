import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/item_collection.dart';
import 'package:sazashopping/shared/colors.dart';

class MainItemList extends StatefulWidget {
  final bool connetion;
  final String id;
  final List<String> subItems;
  MainItemList({this.connetion, this.id, this.subItems});
  @override
  _MainItemListState createState() => _MainItemListState();
}

class _MainItemListState extends State<MainItemList> {
  List<String> subItemList;
  int _length = 2;
  int maxLength;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    maxLength = widget.subItems.length;
    subItemList = widget.subItems.sublist(0, 2);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _getMoreData() {
    if (_length <= maxLength) {
      for (int i = _length; i < _length + 1; i++) {
        setState(() {
          subItemList.add(widget.subItems[i]);
        });
      }
      setState(() {
        _length = _length + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(color: backgroudColor),
        child: Column(
          children: [
            // Container(
            //     width: MediaQuery.of(context).size.width,
            //     height: MediaQuery.of(context).size.height * 0.30,
            //     child: OfferItems()), // offer
            // SizedBox(
            //   height: 10.0,
            // ),
            Container(
              child: ListView.builder(
                itemCount: subItemList.length + 1,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index == maxLength) {
                    return Container(
                      child: Center(
                        child: Text(
                          'already have not new items',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    );
                  } else if (index == subItemList.length) {
                    return CupertinoActivityIndicator();
                  }
                  return Container(
                      child: ItemTile(
                          id: widget.id,
                          itemname: subItemList[index],
                          connection: widget.connetion));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
