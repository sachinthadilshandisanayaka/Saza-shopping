import 'package:flutter/material.dart';

Widget noItemWidget({BuildContext context}) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Center(
        child: Text('no item'),
      ),
    ),
  );
}
