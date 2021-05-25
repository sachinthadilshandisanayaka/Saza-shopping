import 'package:flutter/material.dart';
import 'package:sazashopping/screens/additems/wrapper.dart';
import 'package:sazashopping/shared/colors.dart';

class ItemAddMainFrame extends StatelessWidget {
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
