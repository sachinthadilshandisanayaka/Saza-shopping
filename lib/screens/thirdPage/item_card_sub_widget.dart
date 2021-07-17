import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/thirdPage/shared/itemCounterButton.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/string.dart';

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
      _counter = 1;
    });
  }

  @override
  void dispose() {
    super.dispose();
    setState(() {
      _counter = 1;
    });
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
        color: appBarColor,
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
            width: cardWidth * 0.40,
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
            width: cardWidth * 0.58,
            height: cardHeight * 0.95,
            child: Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.clip,
              children: <Widget>[
                Container(
                  width: cardWidth * 0.58,
                  height: 40,
                  child: Text(
                    widget.mainItems.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                    ),
                    softWrap: false,
                  ),
                ),
                Positioned(
                  top: 45,
                  left: 0,
                  child: Container(
                    width: cardWidth * 0.58,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          srilankaRuppes + ' ' + widget.mainItems.price,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        widget.mainItems.offer == 0.0
                            ? SizedBox()
                            : Container(
                                child: Text(
                                  '-' + widget.mainItems.offer.toString() + '%',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  child: Container(
                    height: 45,
                    width: cardWidth * 0.58,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CounterButton(
                          size: widget.mainItems.quantity,
                          count: _counter,
                          incress: () => setState(() {
                            _counter++;
                          }),
                          descrise: () => setState(() {
                            _counter--;
                          }),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.shopping_cart_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
