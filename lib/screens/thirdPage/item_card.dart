import 'package:flutter/material.dart';
import 'package:sazashopping/error_ui/defaultLoseConnectionScreen.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/secondPage/selectedItemDisplay.dart';
import 'package:sazashopping/screens/thirdPage/item_card_sub_widget.dart';

class ItemCardView extends StatelessWidget {
  final connection = true;
  final MainItems itemList;

  ItemCardView({@required this.itemList});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (connection) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectedItemDisplay(
                mainItems: this.itemList,
              ),
            ),
          );
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NoConnection()));
        }
      },
      child: SubCardWidget(
        mainItems: this.itemList,
      ),
    );
  }
}
