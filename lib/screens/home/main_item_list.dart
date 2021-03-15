import 'dart:async';
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
  StreamController _streamController;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<List<String>>.broadcast();
    
  }

  @override
  Widget build(BuildContext context) {
    nameContact = NameContant.dbName ?? null;

    return SingleChildScrollView(
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
                  itemCount: nameContact.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
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
