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
              ),
            ),
          );
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
              width: 180,
              child: Hero(
                tag: shopItem,
                child: Image.network(
                  this.shopItem.image,
                  fit: BoxFit.fitWidth,
                  loadingBuilder: (context, child, progress) {
                    return progress == null ? child : LinearProgressIndicator();
                  },
                ),
              ),
            ),
            Container(
              height: 70,
              width: 180,
              padding: const EdgeInsets.only(left: 10.0, top: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    shopItem.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: itemTileNameDecoration,
                    softWrap: false,
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
