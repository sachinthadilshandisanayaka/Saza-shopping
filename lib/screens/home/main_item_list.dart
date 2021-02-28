import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/screens/home/catogeries/offer_item.dart';
import 'package:sazashopping/screens/home/homeItemNames/nameConstant.dart';
import 'package:sazashopping/screens/home/item_tile.dart';

// import 'package:sazashopping/screens/home/catogeries/catogeries_list.dart';
// import 'package:sazashopping/screens/home/catogeries/offer_item.dart';

class MainItemList extends StatefulWidget {
  @override
  _MainItemListState createState() => _MainItemListState();
}

class _MainItemListState extends State<MainItemList> {
  final nameContant = NameContant.dbName;
  @override
  Widget build(BuildContext context) {
    final shopItems = Provider.of<QuerySnapshot>(context);
    print(shopItems);
    print(nameContant[0]);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          OfferItems(),
          SizedBox(
            height: 15.0,
          ),
          Container(
            child: ListView.builder(
              itemCount: nameContant.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                print("hello + " + nameContant[index]);
                return ItemTile(itemname: nameContant[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
