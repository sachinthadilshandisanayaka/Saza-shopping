import 'package:flutter/material.dart';
import 'package:sazashopping/shared/testStyles.dart';

Widget subItemRow({String tabname, String value}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Colors.teal[100],
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.white,
    ),
    padding: EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          tabname,
          style: tabValueStyle,
        ),
        Text(
          value,
          style: tagStyle,
        )
      ],
    ),
  );
}
