import 'package:flutter/material.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';

class RaiseButtonCenter extends StatelessWidget {
  final Function pressBottonFuntion;
  final String buttonLable;
  RaiseButtonCenter(
      {@required this.pressBottonFuntion, @required this.buttonLable});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: RaisedButton(
          padding: EdgeInsets.only(
            left: 13,
            right: 13,
            top: 14,
            bottom: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          color: appBarColor,
          onPressed: () async => await pressBottonFuntion(),
          child: Text(
            buttonLable,
            style: buybuttonStyle,
          ),
        ),
      ),
    );
  }
}
