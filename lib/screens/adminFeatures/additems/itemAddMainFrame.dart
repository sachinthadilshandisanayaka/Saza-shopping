import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/adminFeatures/additems/wrapper.dart';
import 'package:sazashopping/shared/colors.dart';

class ItemAddMainFrame extends StatelessWidget {
  final MainItems mainItems;
  ItemAddMainFrame({this.mainItems});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: additemPageBackgroundColor,
        appBar: AppBar(
          backgroundColor: appBarColor,
          actions: [],
        ),
        body: WrapperAdditem(),
      ),
    );
  }
}
