import 'package:flutter/material.dart';

class CategeriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 5,
      shadowColor: Colors.black,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: LabelTopItem(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: showEachItemHorizontalList(),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget LabelTopItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Shirts'),
        Text('MORE'),
      ],
    );
  }

  Widget showEachItemHorizontalList() {
    return Container(
      height: 160.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          
        ],
      ),
    );
  }
}
