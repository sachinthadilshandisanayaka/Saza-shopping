import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/database_stream_to_get_item_collection.dart';
import 'package:sazashopping/screens/home/share/paginationLoading.dart';
import 'package:sazashopping/shared/colors.dart';

class Home extends StatefulWidget {
  final bool connetion;
  final String id;
  final List<String> subItems;
  Home({this.connetion, this.id, this.subItems});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> subItemList;
  int _length = 10;
  int incrementValue = 2;
  int maxLength;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    setState(() {
      maxLength = widget.subItems.length;
      // subItemList = widget.subItems.sublist(0, 1);

      subItemList = widget.subItems.length > 10
          ? widget.subItems.sublist(0, 10)
          : widget.subItems;

      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          _getMoreData();
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _getMoreData() {
    if (!((_length > maxLength) && (_length - maxLength >= 2))) {
      for (int i = _length; i <= _length + 1; i++) {
        setState(() {
          subItemList.add(widget.subItems[i]);
        });
      }
      setState(() {
        _length = _length + incrementValue;
        print('--------------------' + _length.toString());
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
                    return PaginationLoading();
                  }
                  return ItemTile(
                      id: widget.id,
                      itemname: subItemList[index],
                      connection: widget.connetion);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
