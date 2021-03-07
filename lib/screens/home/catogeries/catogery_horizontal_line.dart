import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/catogeries/catogery_tile.dart';
import 'package:sazashopping/shared/constant.dart';

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
      height: 210.0,
      color: backgroudColor, // here
      child: ListView.builder(
        itemCount: shopItems.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(5),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return shopItems.length == 0
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.teal[200]),
                )
              : Container(
                  padding: EdgeInsets.only(bottom: 12),
                  margin: EdgeInsets.only(left: 6, right: 6, bottom: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 2,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ImageAdnDataDislpay(
                    shopItem: shopItems[index],
                  ),
                );
        },
      ),
    );
  }
}
