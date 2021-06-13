import 'package:flutter/material.dart';
import 'package:sazashopping/shared/constant.dart';

class ItemDetailDisplaty extends StatelessWidget {
  final String value;
  final String tag;
  ItemDetailDisplaty({@required this.value, @required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.teal[200],
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
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
