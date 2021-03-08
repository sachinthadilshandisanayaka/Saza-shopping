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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 110,
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
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  shopItem.name,
                  style: TextStyle(
                    fontFamily: 'Baloo2',
                    fontWeight: FontWeight.w100,
                    fontSize: 11,
                    // shadows: <Shadow>[
                    //   Shadow(
                    //     offset: Offset(0.0, 1),
                    //     blurRadius: 10.0,
                    //     color: Colors.black45,
                    //   )
                    // ],
                  ),
                ),
                Text(
                  "LKR" + shopItem.price,
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Baloo2',
                    fontWeight: FontWeight.w500,
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
