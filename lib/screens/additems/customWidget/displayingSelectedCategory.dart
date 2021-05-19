import 'package:flutter/material.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';

class DisplaySelectedCategory extends StatefulWidget {
  final String selectedCategoryBydefault;
  final Map<String, String> productCategory;
  DisplaySelectedCategory(this.selectedCategoryBydefault, this.productCategory);

  @override
  _DisplaySelectedCategoryState createState() =>
      _DisplaySelectedCategoryState();
}

class _DisplaySelectedCategoryState extends State<DisplaySelectedCategory> {
  @override
  Widget build(BuildContext context) {
    return widget.selectedCategoryBydefault.isEmpty ||
            widget.selectedCategoryBydefault == null ||
            widget.selectedCategoryBydefault == ''
        ? SizedBox()
        : Text(
            widget.productCategory[widget.selectedCategoryBydefault]
                    .toString() +
                " > " +
                widget.selectedCategoryBydefault.toString(),
            style: inputFormTextStyle.copyWith(
                color: appBarColor, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          );
  }
}
