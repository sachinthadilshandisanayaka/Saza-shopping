import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    for (var doc in shopItems.docs) {
      print(doc.data());
    }
    return Container(
      // child: Text('tesing'),
      child: ListView.builder(
        itemCount: nameContant.length,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ItemTile(itemname: nameContant[index]);
        },
        // children: <Widget>[
        //   SizedBox(
        //     height: 10.0,
        //   ),
        //   OfferItems(),
        //   SizedBox(
        //     height: 20.0,
        //   ),
        //   CategeriesList(),
        //   SizedBox(
        //     height: 20.0,
        //   ),
        //   CategeriesList(),
        //   SizedBox(
        //     height: 20.0,
        //   ),
        //   CategeriesList(),
        //   SizedBox(
        //     height: 20.0,
        //   ),
        //   ShoesContaioner(),
        // ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ShirtContaioner() {
    return Container(
      child: Text('image'),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TrouserContaioner() {
    return Container(
      child: Text('image'),
    );
  }

  // ignore: non_constant_identifier_names
  Widget WatchContaioner() {
    return Container(
      child: Text('image'),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ShoesContaioner() {
    return Container(
      child: Text('image'),
    );
  }
}
