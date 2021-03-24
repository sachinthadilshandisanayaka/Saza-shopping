import 'package:flutter/material.dart';
import 'package:sazashopping/error_ui/defaultLoseConnectionScreen.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/secondPage/selectedItemDisplay.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/string.dart';

class ImageAdnDataDislpay extends StatelessWidget {
  final MainItems shopItem;
  final bool connetion;
  ImageAdnDataDislpay({@required this.shopItem, @required this.connetion});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (connetion) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SelectedItemDisplay(
                        mainItems: this.shopItem,
                      )));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NoConnection()));
        }
      },
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              width: 160,
              child: Hero(
                tag: shopItem,
                child: Image.network(
                  this.shopItem.image,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    return progress == null ? child : LinearProgressIndicator();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    shopItem.name,
                    style: itemTileNameDecoration,
                  ),
                  Text(
                    srilankaRuppes + ' ' + shopItem.price,
                    style: itemTilePriceShowDecoration,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
