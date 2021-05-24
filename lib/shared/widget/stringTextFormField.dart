import 'package:flutter/material.dart';
import 'package:sazashopping/screens/additems/formValidator/stringValidator.dart';
import 'package:sazashopping/shared/constant.dart';

Widget stringTextFormField(
    {@required Function funtion, TextInputType textInputType, int maxline}) {
  return TextFormField(
    maxLines: maxline ?? 1,
    keyboardType: textInputType ?? TextInputType.text,
    decoration: textinputDecoration,
    onChanged: (val) => funtion(val),
    validator: (val) => checkValue(val),
  );
}
