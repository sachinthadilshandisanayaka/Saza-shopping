import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/shared/colors.dart';

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
            height: 140,
            width: 110,
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('assets/watch.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
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
                  "LKR" + shopItem.price,
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
