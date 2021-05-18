import 'dart:ui';

import 'package:lite_rolling_switch/lite_rolling_switch.dart';
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
  final genderSelected = TextEditingController();

  String productname;
  String productMaterial;
  String brandName;
  String maleOrFemale;
  String madeCountry;
  String description;
  String selectedCategoryBydefault;
  int quantity;
  String procudeSizeType;
  List<String> productColors = new List();
  List<String> productSize = new List();
  List<String> productSubCategory = new List();
  Map<String, String> productCategory = new Map();
  bool genderVisibility = false;
  bool genderVisibilityDefault;

  changeVisibility(bool visibility, String feild) {
    setState(() {
      if (feild == "gender") {
        genderVisibility = visibility;
      }
    });
  }

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
                        });
                      },
                    ),
                    DisplaySelectedCategory(
                        selectedCategoryBydefault ?? '', productCategory),
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
                    sizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Gender',
                          style: inputFormTextStyle,
                        ),
                        new Container(
                          height: 35.0,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: new LiteRollingSwitch(
                              value: false,
                              textOn: "active",
                              textOff: "inactive",
                              colorOn: Colors.greenAccent,
                              colorOff: Colors.redAccent,
                              iconOn: Icons.done,
                              iconOff: Icons.remove_circle_outline,
                              onChanged: (bool state) {
                                genderVisibilityDefault = state;
                              },
                              onTap: () {
                                changeVisibility(
                                    genderVisibilityDefault, "gender");
                              },
                              onSwipe: () {
                                changeVisibility(
                                    genderVisibilityDefault, "gender");
                              },
                              onDoubleTap: () {
                                changeVisibility(
                                    genderVisibilityDefault, "gender");
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBox,
                    genderVisibility
                        ? new Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            padding: EdgeInsets.only(
                              left: 5.0,
                              right: 5.0,
                              top: 2.0,
                              bottom: 2.0,
                            ),
                            child: new DropdownButton(
                              focusColor: Colors.white,
                              hint: Text(
                                'Select gender',
                                style: inputFormTextStyle,
                              ),
                              isExpanded: true,
                              iconSize: 22,
                              value: maleOrFemale,
                              icon: Icon(Icons.arrow_drop_down),
                              underline: SizedBox(),
                              onChanged: (newValue) {
                                setState(() {
                                  maleOrFemale = newValue;
                                });
                              },
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
                          )
                        // DropDownField(
                        //     controller: genderSelected,
                        //     hintText: "Choose gender",
                        //     textStyle: inputFormTextStyle,
                        //     enabled: true,
                        //     items: gender,
                        //     itemsVisibleInDropdown: 3,
                        //     onValueChanged: (value) {
                        //       setState(() {
                        //         maleOrFemale = value;
                        //       });
                        //     },
                        //   )
                        : SizedBox(),
                    SizedBox(
                      height: 60,
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

List<String> gender = ["Male", "Female", "Both"];

Widget sizedBox = SizedBox(
  height: 10,
);

Widget displayText(text) {
  return Text(text, style: inputFormTextStyle);
}
