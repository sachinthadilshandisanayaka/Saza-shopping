import 'package:flutter/material.dart';
import 'package:sazashopping/error_ui/defaultLoseConnectionScreen.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/secondPage/selectedItemDisplay.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/string.dart';
import 'package:sazashopping/shared/testStyles.dart';
import 'package:sazashopping/shared/widget/ellipsisTextBar.dart';

class ImageAdnDataDislpay extends StatelessWidget {
  final MainItems shopItem;
  final bool connetion;
  ImageAdnDataDislpay({@required this.shopItem, @required this.connetion});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (connetion) {
          await Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => SelectedItemDisplay(
                mainItems: this.shopItem,
              ),
            ),
          );
        } else {
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      NoConnection(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = Offset(1.0, 0.0);
                    var end = Offset(0.0, 0.0);
                    var curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  }));
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
                  this.shopItem.images[0],
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
              padding:
                  const EdgeInsets.only(left: 10.0, top: 25.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ellipsisText(text: shopItem.name),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        srilankaRuppes + ' ' + shopItem.price,
                        style: itemTilePriceShowDecoration,
                      ),
                      shopItem.offer == 0
                          ? SizedBox()
                          : Container(
                              child: Text(
                                '-' + shopItem.offer.toString() + '%',
                                style: offerTestStyle,
                              ),
                            )
                    ],
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
