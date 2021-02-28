import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';

class ImageAdnDataDislpay extends StatelessWidget {
  final MainItems shopItem;
  ImageAdnDataDislpay({this.shopItem});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new AssetImage('assets/watch.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(shopItem.name),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Text(shopItem.price),
            Icon(
              Icons.money,
              size: 10.0,
            ),
          ],
        ),
      ],
    );
  }
}
