import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sazashopping/error_ui/defaultLoseConnectionScreen.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/secondPage/selectedItemDisplay.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/string.dart';
import 'package:sazashopping/shared/testStyles.dart';

class ItemCardView extends StatelessWidget {
  final connection = true;
  final MainItems itemList;

  ItemCardView({@required this.itemList});
  @override
  Widget build(BuildContext context) {
    final cardHeight = MediaQuery.of(context).size.height * 0.30;
    final cardWidth = MediaQuery.of(context).size.width * 0.90;
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: cardWidth * 0.50,
                height: cardWidth,
                margin: EdgeInsets.only(left: 0),
                child: Hero(
                  tag: itemList,
                  child: Image.network(
                    itemList.image,
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
                width: cardWidth * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      itemList.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: nameStyle,
                      softWrap: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          srilankaRuppes + ' ' + itemList.price,
                          style: priceStyle,
                        ),
                        Text(
                          'Available' + ' ' + itemList.quantity.toString(),
                          style: quantityStyle,
                        ),
                      ],
                    ),
                    Text(
                      material + ' : ' + itemList.material,
                      style: materialStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
