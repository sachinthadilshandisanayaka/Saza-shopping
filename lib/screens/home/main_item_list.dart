import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/catogeries/offer_item.dart';
import 'package:sazashopping/screens/home/homeItemNames/nameConstant.dart';
import 'package:sazashopping/screens/home/item_collection.dart';
import 'package:sazashopping/shared/clipPath/messageClipPath.dart';
import 'package:sazashopping/shared/colors.dart';

class MainItemList extends StatefulWidget {
  @override
  _MainItemListState createState() => _MainItemListState();
}

class _MainItemListState extends State<MainItemList> {
  List<String> nameContact;
  int _length = 2;
  int maxLength;

  // Stream<List<String>> stream;
  // StreamController _streamController;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    maxLength = NameContant.dbName.length;
    nameContact = NameContant.dbName.sublist(0, 2);
    // _streamController = StreamController<List<String>>.broadcast();
    // stream = _streamController.stream;
    // _streamController.add(NameContant.dbName ?? null);

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
      print('na na');
      for (int i = _length; i < _length + 1; i++) {
        setState(() {
          nameContact.add(NameContant.dbName[i]);
        });
      }
      setState(() {
        _length = _length + 1;
      });

      print('hello');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      child: ClipPath(
        clipper: MessageClipper(),
        child: Container(
          decoration: BoxDecoration(color: backgroudColor),
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: OfferItems()), // offer
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: ListView.builder(
                  itemCount: nameContact.length + 1,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == maxLength) {
                      return Container(
                        child: Center(
                          child: Text(
                            'already have not new items',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ), 
                          
                        ),
                      );
                    } else if (index == nameContact.length) {
                      return CupertinoActivityIndicator();
                    }
                    return Container(
                        child: ItemTile(itemname: nameContact[index]));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
