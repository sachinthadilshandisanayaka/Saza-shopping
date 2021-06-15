import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sazashopping/shared/colors.dart';

const textinputDecoration = InputDecoration(
  hintStyle: TextStyle(fontFamily: 'Baloo2', fontWeight: FontWeight.normal),
  border: OutlineInputBorder(),
  isDense: true,
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
);
var textinputDecoration2 = InputDecoration(
  labelStyle: TextStyle(
    fontFamily: 'Baloo2',
    fontWeight: FontWeight.normal,
  ),
  hintStyle: TextStyle(
    fontFamily: 'Baloo2',
    fontWeight: FontWeight.normal,
  ),
  border: OutlineInputBorder(),
  isDense: true,
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: appBarColor,
      width: 2.0,
    ),
  ),
);

var formBoxDecoration = BoxDecoration(
  color: Colors.teal[50],
  borderRadius: BorderRadius.circular(
    20,
  ),
  boxShadow: [
    BoxShadow(
      blurRadius: 1,
      offset: Offset(1, 1),
    )
  ],
);

const signPageMainTagDecoration = TextStyle(
  color: Colors.black,
  letterSpacing: 2.0,
  fontFamily: 'Montserrat',
  fontSize: 40,
  fontWeight: FontWeight.bold,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 7.0,
      color: Colors.white,
    )
  ],
);

const itemnameStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat',
);

const itemdefaultStyle = TextStyle(
  fontFamily: 'OpenSans',
);

var cartButtonStyle = TextStyle(
  color: Colors.amber[700],
  letterSpacing: 2,
  fontFamily: 'Montserrat',
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

var buybuttonStyle = TextStyle(
  color: Colors.white,
  letterSpacing: 2,
  fontFamily: 'Montserrat',
  fontSize: 14,
  fontWeight: FontWeight.bold,
  shadows: [
    Shadow(
      color: Colors.black45,
      blurRadius: 3,
      offset: Offset(0, 1),
    ),
  ],
);

var carElevatedStryle = ElevatedButton.styleFrom(
  padding: EdgeInsets.all(12),
  side: BorderSide(
    width: 2.0,
    color: Colors.amber[700],
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
);

const itemPriceStyle = TextStyle(
  fontSize: 18,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.bold,
  color: Colors.teal,
);

var itemTilePriceShowDecoration = TextStyle(
  color: appBarColor,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  fontSize: 14,
);

const itemTileNameDecoration = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w100,
  fontSize: 11,
);

var itemsTypeNameDecoration = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 20,
  color: appBarColor,
  shadows: [
    Shadow(
      color: itemShadowColor,
      blurRadius: 8,
      offset: Offset(0, 4),
    )
  ],
  letterSpacing: 1,
);

var defaultBoxDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: itemShadowColor,
      blurRadius: 3,
      offset: Offset(0, 0.1),
    ),
  ],
);

var inputFormTextStyle = TextStyle(
  fontFamily: 'Baloo2',
  fontWeight: FontWeight.bold,
);

var addItemFormTextStyle = TextStyle(
  fontFamily: 'Baloo2',
  fontWeight: FontWeight.normal,
);
