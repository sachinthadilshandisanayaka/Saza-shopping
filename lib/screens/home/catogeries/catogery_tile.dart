import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/retrievImage/getItemImages.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/string.dart';

class ImageAdnDataDislpay extends StatelessWidget {
  final MainItems shopItem;
  ImageAdnDataDislpay({this.shopItem});
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 170,
            width: 140,
            child: RetrievImageFromDataBase(
              image: this.shopItem.image,
              id: this.shopItem.itemId,
            ),
            // decoration: new BoxDecoration(
            //   image: DecorationImage(
            //     image: new AssetImage('assets/watch.jpg'),
            //     fit: BoxFit.cover,
            //   ),
            //   borderRadius: BorderRadius.circular(12),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  shopItem.name,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w100,
                    fontSize: 11,
                  ),
                ),
                Text(
                  srilankaRuppes + shopItem.price,
                  style: TextStyle(
                    color: appBarColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
