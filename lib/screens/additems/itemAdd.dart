import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/screens/additems/customWidget/displayingSelectedCategory.dart';
import 'package:sazashopping/services/categoryCollection.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';

class ItemAdding extends StatefulWidget {
  @override
  _ItemAddingState createState() => _ItemAddingState();
}

class _ItemAddingState extends State<ItemAdding> {
  final _formKeyAddItem = GlobalKey<FormState>();
  final categorySelected = TextEditingController();

  String productname;
  String productMaterial;
  String brandName;
  String maleOrFemale;
  String madeCountry;
  String description;
  String selectedCategoryBydefault;
  String selectedCategoryBydefault2;
  int quantity;
  String procudeSizeType;
  List<String> productColors = new List();
  List<String> productSize = new List();
  List<String> productSubCategory = new List();
  Map<String, String> productCategory = new Map();

  // Widget displaySelectedCategory(pC) {
  //   return selectedCategoryBydefault == null ||
  //           selectedCategoryBydefault.toString().isEmpty
  //       ? SizedBox()
  //       : Text(
  //           pC[selectedCategoryBydefault].toString() +
  //               " > " +
  //               selectedCategoryBydefault.toString(),
  //           style: inputFormTextStyle.copyWith(
  //               color: appBarColor, fontWeight: FontWeight.bold));
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: additemPageBackgroundColor,
        appBar: AppBar(
          backgroundColor: appBarColor,
          actions: [],
        ),
        body: StreamBuilder(
          stream: CategoryDataBaseService().catogories,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              for (var category in snapshot.data) {
                for (var ct in category.category) {
                  if (!productSubCategory.contains(ct)) {
                    productCategory[ct] = category.name.toString();
                    productSubCategory.add(ct.toString() ?? '');
                  }
                }
              }
            }
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(15.0),
              child: Form(
                key: _formKeyAddItem,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    displayText('Item name'),
                    TextFormField(
                      decoration: textinputDecoration,
                      onChanged: (val) {
                        setState(() {
                          productname = val.trim();
                        });
                      },
                      validator: (val) {
                        return val.trim().isEmpty ? 'Enter item name' : null;
                      },
                    ),
                    sizedBox,
                    displayText('Category'),
                    DropDownField(
                      controller: categorySelected,
                      hintText: "Select item category",
                      textStyle: inputFormTextStyle,
                      enabled: true,
                      items: productSubCategory,
                      itemsVisibleInDropdown: 5,
                      onValueChanged: (value) {
                        setState(() {
                          selectedCategoryBydefault = value;
                          print("----> 1" + selectedCategoryBydefault);
                        });
                      },
                      setter: (newValue) {
                        selectedCategoryBydefault2 = newValue;
                        print("----> 2" + selectedCategoryBydefault2);
                      },
                    ),
                    DisplaySelectedCategory(
                        selectedCategoryBydefault, productCategory),
                    sizedBox,
                    displayText('Material'),
                    TextFormField(
                      decoration: textinputDecoration,
                      onChanged: (val) {
                        setState(() {
                          productMaterial = val.trim();
                        });
                      },
                      validator: (val) {
                        return val.trim().isEmpty ? 'Enter material' : null;
                      },
                    ),
                    sizedBox,
                    displayText('Brand'),
                    TextFormField(
                      decoration: textinputDecoration,
                      onChanged: (val) {
                        setState(() {
                          brandName = val.trim();
                        });
                      },
                      validator: (val) {
                        return val.trim().isEmpty ? 'Enter Brand' : null;
                      },
                    ),
                    sizedBox,
                    displayText('Made in'),
                    TextFormField(
                      decoration: textinputDecoration,
                      onChanged: (val) {
                        setState(() {
                          madeCountry = val.trim();
                        });
                      },
                      validator: (val) {
                        return val.trim().isEmpty ? 'Enter Country' : null;
                      },
                    ),
                    sizedBox,
                    Text(
                      'Quantity Avilable',
                      style: inputFormTextStyle,
                    ),
                    TextFormField(
                      decoration: textinputDecoration,
                      onChanged: (val) {
                        setState(() {
                          madeCountry = val.trim();
                        });
                      },
                      validator: (val) {
                        return val.trim().isEmpty ? 'Add quantity' : null;
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget sizedBox = SizedBox(
  height: 10,
);

Widget displayText(text) {
  return Text(text, style: inputFormTextStyle);
}
