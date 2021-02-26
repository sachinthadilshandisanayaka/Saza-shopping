import 'dart:ui';

import 'package:flutter/material.dart';

class OfferItems extends StatefulWidget {
  @override
  _OfferItemsState createState() => _OfferItemsState();
}

class _OfferItemsState extends State<OfferItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Image(
        image: AssetImage('file:///D:/practices/Flutter/test.webp'),
        fit: BoxFit.cover,
      ),
    );
  }
}
