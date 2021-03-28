import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';

class ItemCardView extends StatelessWidget {
  final MainItems itemList;
  ItemCardView({@required this.itemList});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(itemList.name),
    );
  }
}
