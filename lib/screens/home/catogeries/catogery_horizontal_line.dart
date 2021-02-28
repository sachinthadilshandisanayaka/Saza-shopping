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
    final shopItems = Provider.of<List<MainItems>>(context);
    return Container(
      height: 160.0,
      child: ListView.builder(
        itemCount: shopItems.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ImageAdnDataDislpay(shopItem: shopItems[index]);
        },
      ),
    );
  }
}
