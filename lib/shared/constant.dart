import 'dart:ui';

import 'package:flutter/material.dart';

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
  fontFamily: 'Baloo2',
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

const backgroudColor = Colors.white;
