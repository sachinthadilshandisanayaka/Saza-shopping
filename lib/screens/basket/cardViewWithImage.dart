import 'package:flutter/material.dart';
import 'package:sazashopping/models/basket.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/thirdPage/shared/subDetailShow_Row.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/string.dart';
import 'package:sazashopping/shared/testStyles.dart';

class SubCardDisplay extends StatelessWidget {
  final MainItems mainItems;
  final Basket basket;
  SubCardDisplay({@required this.mainItems, @required this.basket});

  @override
  Widget build(BuildContext context) {
    final cardHeight = MediaQuery.of(context).size.height * 0.25;
    final cardWidth = MediaQuery.of(context).size.width * 0.90;
    return InkWell(
      onTap: () async {
        Navigator.pop(context, this.mainItems);
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
          left: 9,
          right: 9,
        ),
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: itemShadowColor,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: cardWidth * 0.50,
                height: cardHeight * 0.95,
                margin: EdgeInsets.only(left: 0),
                child: Hero(
                  tag: mainItems,
                  child: Image.network(
                    mainItems.images[0],
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : LinearProgressIndicator();
                    },
                  ),
                ),
              ),
              Container(
                width: cardWidth * 0.50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      mainItems.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: nameStyle,
                      softWrap: false,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          srilankaRuppes + ' ' + mainItems.price,
                          style: priceStyle,
                        ),
                        mainItems.offer == 0.0
                            ? SizedBox()
                            : Text(
                                '-' + mainItems.offer.toString() + '%',
                                style: offerTestStyle,
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    subItemRow(
                      tabname: 'Colors',
                      value: this.basket.color,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    subItemRow(
                      tabname: 'Size',
                      value: this.basket.size,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    subItemRow(
                      tabname: 'Quantity',
                      value: this.basket.quantity,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
