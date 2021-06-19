import 'package:flutter/material.dart';
import 'package:sazashopping/models/userShippingDetails.dart';
import 'package:sazashopping/screens/adminFeatures/additems/formValidator/stringValidator.dart';
import 'package:sazashopping/services/userDetailDatabase.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/loading.dart';
import 'package:sazashopping/shared/widget/centeredRaiseButton.dart';

class ShowingForm extends StatefulWidget {
  final UserShppingDetail userShppingDetail;
  final String uid;
  ShowingForm({
    this.userShppingDetail,
    this.uid,
  });

  @override
  _ShowingFormState createState() => _ShowingFormState();
}

class _ShowingFormState extends State<ShowingForm> {
  final _formKey = GlobalKey<FormState>();
  UserShppingDetail _userShppingDetail;
  bool _loaging;
  @override
  void initState() {
    super.initState();
    setState(() {
      _loaging = false;
      _userShppingDetail = widget.userShppingDetail;
    });
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
                    initialValue: widget.userShppingDetail.name,
                    decoration: textinputDecoration2.copyWith(
                        labelText: 'Contact name'),
                    onChanged: (val) {
                      setState(() {
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
                    initialValue: widget.userShppingDetail.country,
                    decoration:
                        textinputDecoration2.copyWith(labelText: 'Country'),
                    onChanged: (val) {
                      setState(() {
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
                    initialValue: widget.userShppingDetail.streetAddress1,
                    decoration: textinputDecoration2.copyWith(
                        labelText: 'Street address 1'),
                    keyboardType: TextInputType.streetAddress,
                    onChanged: (val) {
                      setState(() {
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
                    initialValue: widget.userShppingDetail.streetAddress2,
                    decoration: textinputDecoration2.copyWith(
                        labelText: 'Street Address 2'),
                    keyboardType: TextInputType.streetAddress,
                    onChanged: (val) {
                      setState(() {
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
                    initialValue: widget.userShppingDetail.province,
                    decoration:
                        textinputDecoration2.copyWith(labelText: 'Province'),
                    onChanged: (val) {
                      setState(() {
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
                    initialValue: widget.userShppingDetail.postalcode,
                    decoration:
                        textinputDecoration2.copyWith(labelText: 'Postal code'),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      setState(() {
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
                    initialValue: widget.userShppingDetail.city,
                    decoration:
                        textinputDecoration2.copyWith(labelText: 'City'),
                    onChanged: (val) {
                      setState(() {
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
                    initialValue: widget.userShppingDetail.telephone,
                    decoration:
                        textinputDecoration2.copyWith(labelText: 'Telephone'),
                    keyboardType: TextInputType.phone,
                    onChanged: (val) {
                      setState(() {
                        _userShppingDetail.telephone = val.trim();
                      });
                    },
                    validator: (val) => checkValue(val),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  RaiseButtonCenter(
                    buttonLable: 'update',
                    pressBottonFuntion: () async {
                      if (_formKey.currentState.validate()) {
                        _setLaod(true);
                        try {
                          await UserDetailDataBaseService(
                            useiId: widget.uid,
                            userDetail: _userShppingDetail,
                          ).updateUserDetail();

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
}
