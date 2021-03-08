import 'dart:ui';
import 'package:flutter/material.dart';

class OfferItems extends StatefulWidget {
  @override
  _OfferItemsState createState() => _OfferItemsState();
}

class _OfferItemsState extends State<OfferItems> {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/watch.jpg'),
      fit: BoxFit.fitWidth,
    );
  }
}
