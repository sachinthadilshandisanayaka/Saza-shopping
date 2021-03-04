import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/catogeries/offer_item.dart';
import 'package:sazashopping/screens/home/homeItemNames/nameConstant.dart';
import 'package:sazashopping/screens/home/item_collection.dart';

class MainItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nameContant = NameContant.dbName;

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
