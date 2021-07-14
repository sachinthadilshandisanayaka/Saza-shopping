import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/thirdPage/shared/itemCounterButton.dart';
// import 'package:sazashopping/screens/thirdPage/shared/subDetailShow_Row.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/string.dart';
import 'package:sazashopping/shared/testStyles.dart';

class SubCardWidget extends StatefulWidget {
  final MainItems mainItems;
  SubCardWidget({@required this.mainItems});

  @override
  _SubCardWidgetState createState() => _SubCardWidgetState();
}

class _SubCardWidgetState extends State<SubCardWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    setState(() {
      _counter = 0;
    });
  }

  @override
  void dispose() {
    setState(() {
      _counter = 0;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardHeight = MediaQuery.of(context).size.height * 0.25;
    final cardWidth = MediaQuery.of(context).size.width * 0.90;
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: cardWidth * 0.50,
            height: cardHeight * 0.95,
            margin: EdgeInsets.only(left: 0),
            child: Hero(
              tag: widget.mainItems,
              child: Image.network(
                widget.mainItems.images[0],
                fit: BoxFit.contain,
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : LinearProgressIndicator();
                },
              ),
            ),
          ),
          Container(
            width: cardWidth * 0.48,
            height: cardHeight * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.mainItems.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                  ),
                  softWrap: false,
                ),
                SizedBox(
                  height: 6.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      srilankaRuppes + ' ' + widget.mainItems.price,
                      style: priceStyle,
                    ),
                    widget.mainItems.offer == 0.0
                        ? SizedBox()
                        : Text(
                            '-' + widget.mainItems.offer.toString() + '%',
                            style: offerTestStyle,
                          ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: CounterButton(
                        size: widget.mainItems.quantity,
                        count: _counter,
                        incress: () => setState(() {
                          _counter++;
                        }),
                        descrise: () => setState(() {
                          _counter--;
                        }),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart_rounded,
                          color: appBarColor,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                )
                // subItemRow(
                //   tabname: 'Material :',
                //   value: mainItems.material,
                // ),
                // SizedBox(
                //   height: 5,
                // ),
                // subItemRow(
                //   tabname: 'Brand :',
                //   value: mainItems.brand,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
