import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sazashopping/shared/colors.dart';

const textinputDecoration = InputDecoration(
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

var itemTilePriceShowDecoration = TextStyle(
  color: appBarColor,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  fontSize: 13,
);

const itemTileNameDecoration = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w100,
  fontSize: 11,
);

var itemsTypeNameDecoration = TextStyle(
  fontFamily: 'CormorantGaramond',
  fontSize: 22,
  color: appBarColor,
  fontWeight: FontWeight.bold,
  shadows: [
    Shadow(
      color: itemShadowColor,
      blurRadius: 8,
      offset: Offset(0, 4),
    )
  ],
  letterSpacing: 1,
);
