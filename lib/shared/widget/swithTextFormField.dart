import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/screens/additems/formValidator/swithValidator.dart';
import 'package:sazashopping/shared/constant.dart';

Widget swicthTextField({
  String hint,
  @required Function funt,
  bool state,
  TextInputType type,
}) {
  return TextFormField(
    keyboardType: type ?? TextInputType.text,
    decoration: textinputDecoration.copyWith(hintText: hint),
    onChanged: (val) => funt(val),
    validator: (val) => checkValue(val, state),
  );
}
