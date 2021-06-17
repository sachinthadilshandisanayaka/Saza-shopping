import 'package:flutter/material.dart';
import 'package:sazashopping/models/basket.dart';
import 'package:sazashopping/screens/basket/cardView.dart';

class BasketListView extends StatelessWidget {
  final List<Basket> basketList;
  final BuildContext passContext;

  BasketListView({
    @required this.basketList,
    this.passContext,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: this.basketList.length,
              itemBuilder: (context, index) {
                return BacketCardView(
                  basket: basketList[index],
                  passContext: passContext,
                );
              })
        ],
      ),
    );
  }
}
