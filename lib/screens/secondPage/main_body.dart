import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/shared/clipPath/messageClipPath.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/string.dart';
import 'package:sazashopping/shared/widget/centerOutlineButton.dart';
import 'package:sazashopping/shared/widget/centeredRaiseButton.dart';

class ItemCard extends StatefulWidget {
  final MainItems mainItems;
  ItemCard({@required this.mainItems});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  double actualPrice = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if (widget.mainItems.offer != 0.0) {
        actualPrice = _priceCalculate(
            double.parse(widget.mainItems.price), widget.mainItems.offer);
      }
    });
  }

  _priceCalculate(double price, double offer) {
    return (price - (price * (offer / 100)));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          ClipPath(
            clipper: MessageClipper(),
            child: Container(
              decoration: BoxDecoration(color: backgroudColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Hero(
                        tag: widget.mainItems,
                        child: Image.network(
                          widget.mainItems.images[0],
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, progress) {
                            return progress == null
                                ? child
                                : Center(
                                    child: LinearProgressIndicator(),
                                  );
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20.0, left: 5.0, right: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          // decoration: defaultBoxDecoration,
                          child: Text(
                            widget.mainItems.name,
                            style: itemnameStyle,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10.0, bottom: 10.0, top: 0),
                          // decoration: defaultBoxDecoration,
                          child: Text(
                            widget.mainItems.quantity.toString() + ' avalible',
                            style: itemdefaultStyle,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Price',
                                style: itemdefaultStyle,
                              ),
                              Text(
                                srilankaRuppes + ' ' + widget.mainItems.price,
                                style: itemPriceStyle,
                              ),
                            ],
                          ),
                        ),
                        widget.mainItems.offer != 0.0
                            ? Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'offer',
                                      style: itemdefaultStyle,
                                    ),
                                    Text(
                                      widget.mainItems.offer.toString(),
                                      style: itemPriceStyle,
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                        widget.mainItems.offer != 0.0
                            ? Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Actual Price',
                                      style: itemdefaultStyle,
                                    ),
                                    Text(
                                      actualPrice.toString(),
                                      style: itemPriceStyle,
                                    )
                                  ],
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          // decoration: defaultBoxDecoration,
                          child: Text(
                            material + ' : ' + widget.mainItems.material,
                            style: itemdefaultStyle,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  outlineButtonCenter(
                      context: context,
                      buttonLable: addtobasket,
                      pressBottonFuntion: () {}),
                  SizedBox(
                    height: 5,
                  ),
                  raiseButtonCenter(
                      context: context,
                      buttonLable: buy,
                      pressBottonFuntion: () {}),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
