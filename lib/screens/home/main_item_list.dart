import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/catogeries/offer_item.dart';
import 'package:sazashopping/screens/home/homeItemNames/nameConstant.dart';
import 'package:sazashopping/screens/home/item_collection.dart';

class MainItemList extends StatefulWidget {
  @override
  _MainItemListState createState() => _MainItemListState();
}

class _MainItemListState extends State<MainItemList> {
  @override
  Widget build(BuildContext context) {
    final nameContant = NameContant.dbName;
    // final shopItems = Provider.of<QuerySnapshot>(context);
    // print(shopItems);
    // print(nameContant[0]);
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
                // print("hello + " + nameContant[index]);
                return Card(
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 20),
                    child: ItemTile(itemname: nameContant[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
