import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Text(
                                'Color',
                                style: itemdefaultStyle,
                              ),
                            ),
                            widget.mainItems.color.length != 0
                                ? Flexible(
                                    flex: 1,
                                    child: DropdownButtonFormField(
                                      value: selecteColor,
                                      hint: Text(
                                        'choose one',
                                        style: itemdefaultStyle,
                                      ),
                                      isExpanded: true,
                                      onChanged: (value) {
                                        setState(() {
                                          selecteColor = value;
                                        });
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          selecteColor = value;
                                        });
                                      },
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "can't empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      items: widget.mainItems.color
                                          .map((String getcolor) {
                                        return DropdownMenuItem(
                                          value: getcolor,
                                          child: Text(
                                            getcolor,
                                            style: inputFormTextStyle,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    // child: DropDownFormField(
                                    //   titleText: 'Color',
                                    //   hintText: 'choose one',
                                    //   value: color,
                                    //   onSaved: (value) {
                                    //     setState(() {
                                    //       color = value;
                                    //     });
                                    //   },
                                    //   onChanged: (value) {
                                    //     setState(() {
                                    //       color = value;
                                    //     });
                                    //   },
                                    //   dataSource: widget.mainItems.color
                                    //       .map((String getcolor) {
                                    //     return ({
                                    //       "display": getcolor,
                                    //       "value": getcolor,
                                    //     });
                                    //   }).toList(),
                                    //   textField: 'display',
                                    //   valueField: 'value',
                                    // ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Text(
                                'Size',
                                style: itemdefaultStyle,
                              ),
                            ),
                            widget.mainItems.size.length != 0
                                ? Flexible(
                                    flex: 1,
                                    child: DropdownButtonFormField(
                                      value: selecteSize,
                                      hint: Text(
                                        'choose one',
                                        style: itemdefaultStyle,
                                      ),
                                      isExpanded: true,
                                      onChanged: (value) {
                                        setState(() {
                                          selecteSize = value;
                                        });
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          selecteSize = value;
                                        });
                                      },
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "can't empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      items: widget.mainItems.size
                                          .map((String getsize) {
                                        return DropdownMenuItem(
                                          value: getsize,
                                          child: Text(
                                            getsize,
                                            style: inputFormTextStyle,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )
                                : SizedBox(),
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
                  outlineButtonCenter(
                      context: context,
                      buttonLable: addtobasket,
                      pressBottonFuntion: () {}),
                  SizedBox(
                    height: 5,
                  ),
                  RaiseButtonCenter(
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
