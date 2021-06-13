import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/secondPage/shared/dropDownBotton.dart';
import 'package:sazashopping/screens/secondPage/shared/itemCountSelection.dart';
import 'package:sazashopping/shared/clipPath/messageClipPath.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/string.dart';
import 'package:sazashopping/shared/testStyles.dart';
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
  String selecteSize;
  String selecteColor;
  bool stockNotAvilabe = false;
  int count;

  @override
  void initState() {
    super.initState();
    setState(() {
      count = 0;
      if (widget.mainItems.offer != 0.0) {
        actualPrice = _priceCalculate(
            double.parse(widget.mainItems.price), widget.mainItems.offer);
      }
      if (widget.mainItems.quantity == 0) {
        stockNotAvilabe = true;
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
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        FittedBox(
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
                        stockNotAvilabe
                            ? Positioned(
                                top: 100,
                                left: 18,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    width: 4,
                                    color: Colors.red,
                                  )),
                                  child: Text(
                                    'SOLD',
                                    style: itemdefaultStyle.copyWith(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      wordSpacing: 2,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20.0, left: 14.0, right: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.mainItems.name,
                          style: itemnameStyle,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              widget.mainItems.quantity.toString(),
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' avalible',
                              style: itemdefaultStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Price',
                              style: itemdefaultStyle,
                            ),
                            Text(
                              srilankaRuppes + '  ' + widget.mainItems.price,
                              style: itemPriceStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        widget.mainItems.offer != 0.0
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'offer',
                                    style: itemdefaultStyle,
                                  ),
                                  Text(
                                    '-' +
                                        widget.mainItems.offer.toString() +
                                        '%',
                                    style: offerTestStyle,
                                  ),
                                ],
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 7,
                        ),
                        widget.mainItems.offer != 0.0
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Actual Price',
                                    style: itemdefaultStyle,
                                  ),
                                  Text(
                                    srilankaRuppes +
                                        '  ' +
                                        actualPrice.toString(),
                                    style: itemPriceStyle,
                                  )
                                ],
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 10,
                        ),
                        SelectionDropDown(
                          name: 'Color',
                          items: widget.mainItems.color,
                          function: (val) {
                            setState(() {
                              selecteColor = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SelectionDropDown(
                          name: 'Size',
                          items: widget.mainItems.size,
                          function: (val) {
                            setState(() {
                              selecteSize = val;
                            });
                            print(selecteSize.toString());
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Quantity',
                              style: itemdefaultStyle,
                            ),
                            ItemContselect(
                              size: widget.mainItems.quantity,
                              count: count,
                              incress: () => setState(() {
                                count++;
                              }),
                              descrise: () => setState(() {
                                count--;
                              }),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.teal[50],
                          padding: EdgeInsets.only(top: 3, bottom: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                material,
                                style: itemdefaultStyle,
                              ),
                              Text(
                                widget.mainItems.material,
                                style: itemdefaultStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.teal[50],
                          padding: EdgeInsets.only(top: 3, bottom: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Gender',
                                style: itemdefaultStyle,
                              ),
                              Text(
                                widget.mainItems.gender,
                                style: itemdefaultStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.teal[50],
                          padding: EdgeInsets.only(top: 3, bottom: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Made in',
                                style: itemdefaultStyle,
                              ),
                              Text(
                                widget.mainItems.country,
                                style: itemdefaultStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.teal[50],
                          padding: EdgeInsets.only(top: 3, bottom: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Brand name',
                                style: itemdefaultStyle,
                              ),
                              Text(
                                widget.mainItems.brand,
                                style: itemdefaultStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.teal[50],
                          padding: EdgeInsets.all(10),
                          child: Text(
                            widget.mainItems.description,
                            style: itemdefaultStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  stockNotAvilabe
                      ? SizedBox()
                      : OutLineButtonCenter(
                          buttonLable: addtobasket, pressBottonFuntion: () {}),
                  SizedBox(
                    height: 5,
                  ),
                  stockNotAvilabe
                      ? SizedBox()
                      : RaiseButtonCenter(
                          buttonLable: buy, pressBottonFuntion: () {}),
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
