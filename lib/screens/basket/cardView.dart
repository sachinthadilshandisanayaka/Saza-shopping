import 'package:flutter/material.dart';
import 'package:sazashopping/models/basket.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/basket/cardViewWithImage.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/shared/loading.dart';

class BacketCardView extends StatelessWidget {
  final Basket basket;
  BacketCardView({@required this.basket});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MainItems>(
        stream: DataBaseService(
          mainCategoryName: this.basket.mainCat,
          subCategeoryName: this.basket.subcat,
          uid: this.basket.itemid,
        ).databaseSeletecteItem,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SubCardDisplay(
              mainItems: snapshot.data,
              basket: this.basket,
            );
          }
          return Loading();
        });
  }
}
