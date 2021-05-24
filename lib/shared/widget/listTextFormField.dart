import 'package:flutter/material.dart';
import 'package:sazashopping/screens/additems/formValidator/multiValueValidator.dart';
import 'package:sazashopping/shared/constant.dart';

Widget listedTextFormField({
  @required Function funtion,
  @required GlobalKey<FormFieldState> formkey,
  String hint,
  bool isValueNull,
  bool valueIsreadyAvilable,
}) {
  return TextFormField(
    key: formkey,
    decoration: textinputDecoration.copyWith(hintText: hint ?? ''),
    onChanged: (val) => funtion(val),
    validator: (val) => swicthValidate(isValueNull, valueIsreadyAvilable),
  );
}
