import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sazashopping/error_ui/defaultLoseConnectionScreen.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/secondPage/selectedItemDisplay.dart';

class ItemCardView extends StatelessWidget {
  final connection = true;
  final MainItems itemList;

  ItemCardView({@required this.itemList});
  @override
  Widget build(BuildContext context) {
    final cardHeight = MediaQuery.of(context).size.height * 0.30;
    final cardWidth = MediaQuery.of(context).size.width * 0.95;
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
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: FittedBox(
            child: Container(
              width: cardWidth,
              height: cardHeight,
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
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          softWrap: false,
                        ),
                        Text(
                          itemList.price,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          itemList.quantity.toString(),
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
