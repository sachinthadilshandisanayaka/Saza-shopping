import 'package:flutter/material.dart';
import 'package:sazashopping/shared/constant.dart';

Widget listedTextFormField({
  @required Function funtion,
  Function validFunction,
  @required GlobalKey<FormFieldState> formkey,
  String hint,
}) {
  return TextFormField(
    key: formkey,
    decoration: textinputDecoration.copyWith(hintText: hint ?? ''),
    onChanged: (val) => funtion(val),
    validator: (val) => validFunction(val),
  );
}
