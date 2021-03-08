import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/catogeries/offer_item.dart';
import 'package:sazashopping/screens/home/homeItemNames/nameConstant.dart';
import 'package:sazashopping/screens/home/item_collection.dart';
import 'package:sazashopping/shared/clipPath/messageClipPath.dart';
import 'package:sazashopping/shared/colors.dart';

class MainItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nameContant = NameContant.dbName;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ClipPath(
        clipper: MessageClipper(),
        child: Container(
          decoration: BoxDecoration(color: backgroudColor),
          child: Column(
            children: [
              OfferItems(),
              SizedBox(
                height: 10.0,
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
                        shadowColor: Colors.white,
                        borderOnForeground: false,
                        margin: EdgeInsets.only(bottom: 5),
                        child: ItemTile(itemname: nameContant[index]));
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
