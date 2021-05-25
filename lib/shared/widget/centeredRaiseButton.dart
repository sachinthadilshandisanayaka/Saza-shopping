import 'package:flutter/material.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';

Widget raiseButtonCenter(
    {@required Function lading,
    @required Function pressBottonFuntion,
    @required String buttonLable,
    @required BuildContext context,
    @required GlobalKey<FormState> globalKey}) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.95,
      child: RaisedButton(
        padding: EdgeInsets.all(13),
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
