import 'package:flutter/material.dart';
import 'package:sazashopping/shared/testStyles.dart';

Widget subItemRow({String tabname, String value}) {
  return Container(
    color: Colors.teal[50],
    padding: EdgeInsets.all(3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Text(
            tabname,
            style: tabValueStyle,
          ),
        ),
        Flexible(
          flex: 1,
          child: Text(
            value,
            style: tagStyle,
          ),
        )
      ],
    ),
  );
}
