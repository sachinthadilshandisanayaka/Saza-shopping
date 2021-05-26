import 'package:flutter/material.dart';

Widget horisantalLoading() {
  return SizedBox(
    width: 40,
    child: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.teal[200]),
      ),
    ),
  );
}
