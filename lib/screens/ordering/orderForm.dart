import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/orderModel.dart';
import 'package:sazashopping/models/userShippingDetails.dart';
import 'package:sazashopping/screens/adminFeatures/additems/formValidator/stringValidator.dart';
import 'package:sazashopping/screens/secondPage/shared/detailDisplay.dart';
import 'package:sazashopping/services/orderDatabase.dart';
import 'package:sazashopping/services/userDetailDatabase.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/loading.dart';
import 'package:sazashopping/shared/orderState.dart';
import 'package:sazashopping/shared/widget/centeredRaiseButton.dart';
// import 'package:stripe_payment/stripe_payment.dart';
// import 'package:http/http.dart' as http;

class OderForm extends StatefulWidget {
  final UserShppingDetail userShppingDetail;
  final Map basket;
  final String id;
  final List<String> images;
  OderForm({
    this.userShppingDetail,
    @required this.basket,
    @required this.id,
    @required this.images,
  });

  @override
  _OderFormState createState() => _OderFormState();
}

class _OderFormState extends State<OderForm> {
  final _formKey = GlobalKey<FormState>();
  UserShppingDetail _userShppingDetail = new UserShppingDetail();
  bool isUserdataAvilable;
  bool _loaging;
  @override
  void initState() {
    super.initState();
    if (widget.userShppingDetail == null) {
      setState(() {
        isUserdataAvilable = false;
      });
    } else {
      setState(() {
        isUserdataAvilable = true;
        _userShppingDetail = widget.userShppingDetail;
      });
    }
    //   StripePayment.setOptions(StripeOptions(
    //       publishableKey:
    //           'pk_test_51J4psoImpEAKTCWgp7MzARHalAt7ykYWHdENa0XavLMV1rQ1glxlcljKQcUQrw4z32iv1JgeelY9cGfp2Ii6h5bk00dKIUp2SF'));

    //   setState(() {
    //     _loaging = false;
    //     _userShppingDetail = widget.userShppingDetail;
    //   });
  }

  _setLaod(bool val) {
    setState(() {
      _loaging = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loaging
        ? Loading()
        : SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'SHIPPING DETAILS',
                      style: TextStyle(
                        fontFamily: 'Baloo2',
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue:
                        isUserdataAvilable ? widget.userShppingDetail.name : '',
                    decoration: textinputDecoration2.copyWith(
                        labelText: 'Contact name'),
                    onChanged: (val) {
                      return setState(() {
                        _userShppingDetail.name = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue: isUserdataAvilable
                        ? widget.userShppingDetail.country
                        : '',
                    decoration:
                        textinputDecoration2.copyWith(labelText: 'Country'),
                    onChanged: (val) {
                      return setState(() {
                        _userShppingDetail.country = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue: isUserdataAvilable
                        ? widget.userShppingDetail.streetAddress1
                        : '',
                    decoration: textinputDecoration2.copyWith(
                        labelText: 'Street address 1'),
                    keyboardType: TextInputType.streetAddress,
                    onChanged: (val) {
                      return setState(() {
                        _userShppingDetail.streetAddress1 = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue: isUserdataAvilable
                        ? widget.userShppingDetail.streetAddress2
                        : '',
                    decoration: textinputDecoration2.copyWith(
                        labelText: 'Street Address 2'),
                    keyboardType: TextInputType.streetAddress,
                    onChanged: (val) {
                      return setState(() {
                        _userShppingDetail.streetAddress2 = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue: isUserdataAvilable
                        ? widget.userShppingDetail.province
                        : '',
                    decoration:
                        textinputDecoration2.copyWith(labelText: 'Province'),
                    onChanged: (val) {
                      return setState(() {
                        _userShppingDetail.province = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue: isUserdataAvilable
                        ? widget.userShppingDetail.postalcode
                        : '',
                    decoration:
                        textinputDecoration2.copyWith(labelText: 'Postal code'),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      return setState(() {
                        _userShppingDetail.postalcode = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue:
                        isUserdataAvilable ? widget.userShppingDetail.city : '',
                    decoration:
                        textinputDecoration2.copyWith(labelText: 'City'),
                    onChanged: (val) {
                      return setState(() {
                        _userShppingDetail.city = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    initialValue: isUserdataAvilable
                        ? widget.userShppingDetail.telephone
                        : '',
                    decoration:
                        textinputDecoration2.copyWith(labelText: 'Telephone'),
                    keyboardType: TextInputType.phone,
                    onChanged: (val) {
                      return setState(() {
                        _userShppingDetail.telephone = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.teal[50],
                    child: Column(
                      children: <Widget>[
                        ItemDetailDisplaty(
                          tag: "Color",
                          value: widget.basket['color'],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ItemDetailDisplaty(
                          tag: "Size",
                          value: widget.basket['size'],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ItemDetailDisplaty(
                          tag: "Quantity",
                          value: widget.basket['quantity'],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ItemDetailDisplaty(
                          tag: "Total Price",
                          value: widget.basket['totalPrice'],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  RaiseButtonCenter(
                    buttonLable: 'Order now',
                    pressBottonFuntion: () async {
                      if (_formKey.currentState.validate()) {
                        _setLaod(true);
                        try {
                          await UserDetailDataBaseService(
                            useiId: widget.id,
                            userDetail: _userShppingDetail,
                          ).updateUserDetail();

                          DateTime now = new DateTime.now();
                          Timestamp timestamp = new Timestamp.fromDate(now);

                          OrderDetailModel oderModel = OrderDetailModel(
                            itemName: widget.basket['itemName'],
                            name: _userShppingDetail.name ?? '',
                            streetAddress1:
                                _userShppingDetail.streetAddress1 ?? '',
                            streetAddress2:
                                _userShppingDetail.streetAddress2 ?? '',
                            city: _userShppingDetail.city,
                            province: _userShppingDetail.province,
                            postalcode: _userShppingDetail.postalcode,
                            country: _userShppingDetail.country,
                            telephone: _userShppingDetail.telephone,
                            itemid: widget.basket['itemid'],
                            userid: widget.basket['userid'],
                            subcat: widget.basket['subcat'],
                            mainCat: widget.basket['mainCat'],
                            size: widget.basket['size'],
                            quantity: widget.basket['quantity'],
                            color: widget.basket['color'],
                            dataAndTime: timestamp,
                            shippedDateAndTime: timestamp,
                            orderState: OrderState.notShipped,
                            images: widget.images,
                            totalPrice: widget.basket['totalPrice'],
                          );

                          await OrderDatabaseService(
                                  orderDetailModel: oderModel)
                              .uploadOrder();
                          _setLaod(false);

                          Navigator.pop(context, 'success');
                          _formKey.currentState.reset();
                        } catch (e) {
                          print(e.toString());
                          _setLaod(false);
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          );
  }

  // Future<void> startPayment() async {
  //   StripePayment.setStripeAccount(null);

  //   PaymentMethod paymentMethod = PaymentMethod();
  //   paymentMethod = await StripePayment.paymentRequestWithCardForm(
  //     CardFormPaymentRequest(),
  //   ).then((PaymentMethod method) {
  //     return method;
  //   }).catchError((e) {
  //     print(e);
  //   });
  //   startDirectionChange(paymentMethod);
  // }

  // Future<void> startDirectionChange(PaymentMethod paymentMethod) async {
  //   print('payement change start');

  //   final http.Response response = await http.post(Uri.parse);

  // if (response.body != null) {
  //   final paymentIntent = jsonDecode(response.body);
  //   final status = paymentIntent['paymentIntent']['status'];
  //   final acct = paymentIntent['stripeAccount'];

  //   if (status == 'succeeded') {
  //     print('payment done');
  //   } else {
  //     StripePayment.setStripeAccount(acct);
  //     await StripePayment.confirmPaymentIntent(PaymentIntent(
  //             paymentMethodId: paymentIntent['paymentIntent'],
  //             clientSecret: paymentIntent['paymentIntent']['client_secret']))
  //         .then((PaymentIntentResult paymentIntentResult) async {
  //       final paymentStatus = paymentIntentResult.status;
  //       if (paymentStatus == 'succeeded') {
  //         print('payment done');
  //       }
  //     });
  //   }
  // }
}
