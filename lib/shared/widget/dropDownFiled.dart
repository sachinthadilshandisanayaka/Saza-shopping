import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/shared/constant.dart';

Widget dropDownField(
    {@required List<String> productSubCategory,
    Function valueChangeFuntion,
    @required String hint}) {
  return DropDownField(
    hintText: hint,
    textStyle: inputFormTextStyle,
    enabled: true,
    items: productSubCategory,
    itemsVisibleInDropdown: 5,
    onValueChanged: (value) => valueChangeFuntion(value),
  );
}
