import 'package:flutter/material.dart';

Widget defaultCardView({@required Function onpressFuntion}) {
  return Card(
    child: IconButton(
      icon: Icon(Icons.add),
      onPressed: () => onpressFuntion(),
    ),
  );
}
