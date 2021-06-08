import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/secondPage/main_body.dart';
import 'package:sazashopping/shared/colors.dart';

class SelectedItemDisplay extends StatelessWidget {
  final MainItems mainItems;
  SelectedItemDisplay({@required this.mainItems});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: secondAppBarColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: secondAppBarColor,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 5),
              child: IconButton(
                icon: Icon(Icons.shopping_bag_outlined),
                onPressed: () {},
              ),
            )
          ],
        ),
        body: ItemCard(
          mainItems: this.mainItems,
        ),
      ),
    );
  }
}
