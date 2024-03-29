import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/catogeries_row/catogery_tile.dart';
import 'package:sazashopping/shared/colors.dart';

class ImageTile extends StatelessWidget {
  final MainItems mainItems;
  final bool connection;

  ImageTile({@required this.mainItems, @required this.connection});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 270,
      padding: EdgeInsets.only(bottom: 4),
      margin: EdgeInsets.only(left: 6, right: 10, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: itemShadowColor,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ImageAdnDataDislpay(
        shopItem: mainItems,
        connetion: connection,
      ),
    );
  }
}
