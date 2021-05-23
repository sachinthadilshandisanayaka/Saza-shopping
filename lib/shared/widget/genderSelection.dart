import 'package:flutter/material.dart';
import 'package:sazashopping/shared/boxDecoration.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/list.dart';

Widget selectGender(
    {@required String text,
    @required String maleOrFemale,
    @required Function funtion}) {
  return new Container(
    decoration: genderSelecterBoxDecoration,
    padding: EdgeInsets.only(
      left: 5.0,
      right: 5.0,
      top: 2.0,
      bottom: 2.0,
    ),
    child: new DropdownButton(
      focusColor: Colors.white,
      hint: Text(
        text,
        style: inputFormTextStyle,
      ),
      isExpanded: true,
      iconSize: 22,
      value: maleOrFemale,
      icon: Icon(Icons.arrow_drop_down),
      underline: SizedBox(),
      onChanged: (newValue) => funtion(newValue),
      items: gender.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(
            value,
            style: inputFormTextStyle,
          ),
        );
      }).toList(),
    ),
  );
}
