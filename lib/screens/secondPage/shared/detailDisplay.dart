import 'package:flutter/material.dart';
import 'package:sazashopping/shared/constant.dart';

class ItemDetailDisplaty extends StatelessWidget {
  final String value;
  final String tag;
  ItemDetailDisplaty({@required this.value, @required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[50],
      padding: EdgeInsets.only(top: 3, bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.tag,
            style: itemdefaultStyle,
          ),
          Text(
            this.value,
            style: itemdefaultStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
