import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/catogeries/catogery_tile.dart';

class CatogeriesHorizontalTile extends StatefulWidget {
  @override
  _CatogeriesHorizontalTileState createState() =>
      _CatogeriesHorizontalTileState();
}

class _CatogeriesHorizontalTileState extends State<CatogeriesHorizontalTile> {
  @override
  Widget build(BuildContext context) {
    final shopItems = Provider.of<List<MainItems>>(context) ?? [];
    return Container(
      height: 180.0,
      color: Colors.white,
      child: ListView.builder(
        itemCount: shopItems.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(5),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return shopItems.length == null
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.teal[200]),
                )
              : Card(
                  shadowColor: Colors.white,
                  margin: EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.8),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 1)),
                        ],
                      ),
                      child: ImageAdnDataDislpay(shopItem: shopItems[index])),
                );
        },
      ),
    );
  }
}
