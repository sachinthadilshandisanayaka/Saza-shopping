import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/models/user.dart';
import 'package:sazashopping/screens/ordering/orderItemMainFrame.dart';
import 'package:sazashopping/screens/secondPage/shared/detailDisplay.dart';
import 'package:sazashopping/screens/secondPage/shared/dropDownBotton.dart';
import 'package:sazashopping/screens/secondPage/shared/imageDisplay.dart';
import 'package:sazashopping/screens/secondPage/shared/itemCountSelection.dart';
import 'package:sazashopping/services/backetDatabase.dart';
import 'package:sazashopping/shared/clipPath/messageClipPath.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/string.dart';
import 'package:sazashopping/shared/testStyles.dart';
import 'package:sazashopping/shared/uploadLoading.dart';
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
  bool loading;

  @override
  void initState() {
    super.initState();
    setState(() {
      count = 0;
      this.selecteColor = '';
      this.selecteSize = '';
      this.loading = false;
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

  _fishedLoadig() {
    setState(() {
      count = 0;
    });
  }

  _loading(bool val) {
    setState(() {
      loading = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final snackBarColor = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('select item color'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
          Scaffold.of(context).hideCurrentSnackBar();
        },
      ),
      duration: Duration(seconds: 5),
    );
    final snackBarSize = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('select size'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
          Scaffold.of(context).hideCurrentSnackBar();
        },
      ),
      duration: Duration(seconds: 5),
    );
    final snackBarCount = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('select item count'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
          Scaffold.of(context).hideCurrentSnackBar();
        },
      ),
      duration: Duration(seconds: 5),
    );
    final userid = Provider.of<Users>(context);

    return loading
        ? UploadLoading()
        : SingleChildScrollView(
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
                        ItemImageDisplay(
                          mainItems: widget.mainItems,
                          stockNotAvilabe: stockNotAvilabe,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: 20.0,
                            left: 15.0,
                            right: 15.0,
                          ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Price',
                                    style: itemdefaultStyle,
                                  ),
                                  Text(
                                    srilankaRuppes +
                                        '  ' +
                                        widget.mainItems.price,
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
                                              widget.mainItems.offer
                                                  .toString() +
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
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              ItemDetailDisplaty(
                                tag: material,
                                value: widget.mainItems.material,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ItemDetailDisplaty(
                                tag: 'Gender',
                                value: widget.mainItems.gender,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ItemDetailDisplaty(
                                tag: 'Made in',
                                value: widget.mainItems.country,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ItemDetailDisplaty(
                                tag: 'Brand name',
                                value: widget.mainItems.brand,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.teal[200],
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
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
                                buttonLable: addtobasket,
                                pressBottonFuntion: () async {
                                  _loading(true);
                                  try {
                                    if (this.count == 0) {
                                      Scaffold.of(context)
                                          .showSnackBar(snackBarCount);
                                    } else if (this.selecteColor.isEmpty &&
                                        widget.mainItems.color.length != 0) {
                                      Scaffold.of(context)
                                          .showSnackBar(snackBarColor);
                                    } else if (this.selecteSize.isEmpty &&
                                        widget.mainItems.size.length != 0) {
                                      Scaffold.of(context)
                                          .showSnackBar(snackBarSize);
                                    } else {
                                      Map<String, String> basket = {
                                        'itemName': widget.mainItems.name,
                                        'itemid': widget.mainItems.itemId,
                                        'userid': userid.uid,
                                        'subcat': widget.mainItems.subCat,
                                        'mainCat': widget.mainItems.mainCat,
                                        'size': selecteSize,
                                        'quantity': count.toString(),
                                        'color': selecteColor,
                                      };
                                      await BasketDataBaseService(
                                              userid: userid.uid,
                                              basket: basket)
                                          .updateItem();
                                      _fishedLoadig();
                                    }
                                    _loading(false);
                                  } catch (e) {
                                    _loading(false);
                                    print(e.message);
                                  }
                                },
                              ),
                        SizedBox(
                          height: 5,
                        ),
                        stockNotAvilabe
                            ? SizedBox()
                            : RaiseButtonCenter(
                                buttonLable: buy,
                                pressBottonFuntion: () async {
                                  _loading(true);
                                  try {
                                    if (this.count == 0) {
                                      Scaffold.of(context)
                                          .showSnackBar(snackBarCount);
                                    } else if (this.selecteColor.isEmpty &&
                                        widget.mainItems.color.length != 0) {
                                      Scaffold.of(context)
                                          .showSnackBar(snackBarColor);
                                    } else if (this.selecteSize.isEmpty &&
                                        widget.mainItems.size.length != 0) {
                                      Scaffold.of(context)
                                          .showSnackBar(snackBarSize);
                                    } else {
                                      Map<String, String> basket = {
                                        'itemName': widget.mainItems.name,
                                        'itemid': widget.mainItems.itemId,
                                        'userid': userid.uid,
                                        'subcat': widget.mainItems.subCat,
                                        'mainCat': widget.mainItems.mainCat,
                                        'size': selecteSize,
                                        'quantity': count.toString(),
                                        'color': selecteColor,
                                      };
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              OrderItemMainFrame(
                                            basket: basket,
                                            images: widget.mainItems.images,
                                          ),
                                        ),
                                      );
                                    }
                                    _loading(false);
                                  } catch (e) {
                                    _loading(false);
                                    print(e.message);
                                  }
                                },
                              ),
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
