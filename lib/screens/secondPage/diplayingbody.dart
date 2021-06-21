import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/basket.dart';
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
  final bool navResult;
  final Basket basketFromNav;
  ItemCard({
    @required this.mainItems,
    this.navResult,
    this.basketFromNav,
  });

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  double actualPrice;
  double totalPrice;
  String selecteSize;
  String selecteColor;
  bool stockNotAvilabe = false;
  int count;
  bool loading;

  @override
  void initState() {
    super.initState();

    setState(() {
      this.totalPrice = 0;
      this.actualPrice = 0;
      if (widget.navResult) {
        count = int.parse(widget.basketFromNav.quantity);
        this.selecteColor = widget.basketFromNav.color;
        this.selecteSize = widget.basketFromNav.size;
      } else {
        count = 0;
        this.selecteColor = '';
        this.selecteSize = '';
      }
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

  _totalPriceCalculate() {
    if (widget.mainItems.offer != 0.0) {
      if (this.count != 0) {
        setState(() {
          this.totalPrice = this.actualPrice * this.count;
        });
      }
    } else {
      if (this.count != 0) {
        setState(() {
          this.totalPrice = double.parse(widget.mainItems.price) * this.count;
        });
      }
    }
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
  void dispose() {
    setState(() {
      loading = false;
      _fishedLoadig();
    });
    super.dispose();
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
    final snackBarBuscektUploadSuccess = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('Upload success'),
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
                                selecteSize: widget.navResult
                                    ? widget.basketFromNav.color
                                    : null,
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
                                selecteSize: widget.navResult
                                    ? widget.basketFromNav.size
                                    : null,
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
                                      _totalPriceCalculate();
                                    }),
                                    descrise: () => setState(() {
                                      count--;
                                      _totalPriceCalculate();
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
                          height: 10,
                        ),
                        this.count != 0
                            ? Container(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Total Price',
                                      style: itemdefaultStyle.copyWith(
                                        color: appBarColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      this.totalPrice.toString(),
                                      style: itemdefaultStyle.copyWith(
                                        color: appBarColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 20,
                        ),
                        stockNotAvilabe
                            ? SizedBox()
                            : OutLineButtonCenter(
                                buttonLable: widget.navResult
                                    ? updatebasket
                                    : addtobasket,
                                pressBottonFuntion: () async {
                                  _loading(true);
                                  try {
                                    if (this.count == 0) {
                                      Scaffold.of(context)
                                        ..removeCurrentSnackBar()
                                        ..showSnackBar(snackBarCount);
                                    } else if (this.selecteColor.isEmpty &&
                                        widget.mainItems.color.length != 0) {
                                      Scaffold.of(context)
                                        ..removeCurrentSnackBar()
                                        ..showSnackBar(snackBarColor);
                                    } else if (this.selecteSize.isEmpty &&
                                        widget.mainItems.size.length != 0) {
                                      Scaffold.of(context)
                                        ..removeCurrentSnackBar()
                                        ..showSnackBar(snackBarSize);
                                    } else {
                                      Basket basketModel = new Basket(
                                        userid: userid.uid,
                                        itemid: widget.mainItems.itemId,
                                        itemName: widget.mainItems.name,
                                        size: selecteSize,
                                        color: selecteColor,
                                        subcat: widget.mainItems.subCat,
                                        mainCat: widget.mainItems.mainCat,
                                        quantity: count.toString(),
                                        totalPrice: this.totalPrice.toString(),
                                      );
                                      if (widget.navResult) {
                                        await BasketDataBaseService(
                                                basketModel: basketModel,
                                                basketId: widget
                                                    .basketFromNav.basketId)
                                            .updateItem();
                                        _loading(false);
                                        Navigator.pop(context);
                                      } else {
                                        await BasketDataBaseService(
                                                basketModel: basketModel)
                                            .addBasket();
                                        _loading(false);
                                        Scaffold.of(context)
                                          ..removeCurrentSnackBar()
                                          ..showSnackBar(
                                              snackBarBuscektUploadSuccess);
                                      }

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
                                  try {
                                    if (this.count == 0) {
                                      Scaffold.of(context)
                                        ..removeCurrentSnackBar()
                                        ..showSnackBar(snackBarCount);
                                    } else if (this.selecteColor.isEmpty &&
                                        widget.mainItems.color.length != 0) {
                                      Scaffold.of(context)
                                        ..removeCurrentSnackBar()
                                        ..showSnackBar(snackBarColor);
                                    } else if (this.selecteSize.isEmpty &&
                                        widget.mainItems.size.length != 0) {
                                      Scaffold.of(context)
                                        ..removeCurrentSnackBar()
                                        ..showSnackBar(snackBarSize);
                                    } else {
                                      _loading(true);
                                      Map<String, String> basket = {
                                        'itemName': widget.mainItems.name,
                                        'itemid': widget.mainItems.itemId,
                                        'userid': userid.uid,
                                        'subcat': widget.mainItems.subCat,
                                        'mainCat': widget.mainItems.mainCat,
                                        'size': selecteSize,
                                        'quantity': count.toString(),
                                        'color': selecteColor,
                                        'totalPrice':
                                            this.totalPrice.toString(),
                                      };
                                      var navigationResult =
                                          await Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                          builder: (context) =>
                                              OrderItemMainFrame(
                                            basket: basket,
                                            images: widget.mainItems.images,
                                          ),
                                        ),
                                      );
                                      _loading(false);
                                      if (navigationResult == 'success') {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) =>
                                              CupertinoAlertDialog(
                                            title: Text('Success'),
                                            content: Text('See your orders'),
                                            insetAnimationCurve:
                                                Curves.elasticIn,
                                            actions: <Widget>[
                                              CupertinoDialogAction(
                                                isDefaultAction: false,
                                                child: Text('Ok'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      }
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
