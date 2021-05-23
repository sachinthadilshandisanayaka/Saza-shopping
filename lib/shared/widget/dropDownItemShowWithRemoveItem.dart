import 'package:flutter/material.dart';

Widget dropDownSelectedItems(
    {@required List<String> productColors, @required Function removeItem}) {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    padding: EdgeInsets.only(left: 5.0),
    child: ListView.builder(
      itemCount: productColors.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              productColors[index].toString(),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => removeItem(index),
            )
          ],
        );
      },
    ),
  );
}
