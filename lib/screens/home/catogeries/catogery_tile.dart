import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';

class ImageAdnDataDislpay extends StatelessWidget {
  final MainItems shopItem;
  ImageAdnDataDislpay({this.shopItem});
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: 110,
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('assets/watch.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            shopItem.name,
            style: TextStyle(
              fontFamily: 'CrimsonText',
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 1),
                  blurRadius: 8.0,
                  color: Colors.black45,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'price : ' + shopItem.price,
            style: TextStyle(
              fontFamily: 'CrimsonText',
              fontWeight: FontWeight.w300,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
