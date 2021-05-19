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
  final formkey = GlobalKey<FormFieldState>();

  String productname;
  String productMaterial;
  String brandName;
  String maleOrFemale;
  String madeCountry;
  String description;
  String selectedCategory;
  String procudeSizeType;

  String tempColor;

  int quantity;

  List<String> productColors = new List();
  List<String> productSize = new List();
  List<String> productSubCategory = new List();

  Map<String, String> productCategory = new Map();

  bool genderVisibilityDefault;

  bool colorAllreadyAvilable = false;
  bool colorIsNull = false;
  bool genderVisibility = false;

  changeVisibility(bool visibility, String feild) {
    setState(() {
      if (feild == "gender") {
        genderVisibility = visibility;
      }
    });
  }

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
                          selectedCategory = value;
                        });
                      },
                    ),
                    DisplaySelectedCategory(
                        selectedCategory ?? '', productCategory),
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
                    displayText('Quantity Avilable'),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: textinputDecoration,
                      onChanged: (val) {
                        setState(() {
                          quantity = int.parse(val);
                        });
                      },
                      validator: (val) {
                        if (val.trim().isEmpty) {
                          return 'Add quantity';
                        } else {
                          return null;
                        }
                      },
                    ),
                    sizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        displayText('Gender'),
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
                        : SizedBox(),
                    sizedBox,
                    displayText('Add color'),
                    new TextFormField(
                      key: formkey,
                      decoration: textinputDecoration,
                      onChanged: (val) {
                        setState(() {
                          tempColor = val.trim();
                        });
                      },
                      validator: (val) {
                        if (colorIsNull) {
                          return "Can't be null";
                        } else if (colorAllreadyAvilable) {
                          return "color is already avilbale";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Text('Add'),
                          onPressed: () {
                            // print("-----------" + tempColor.toString());
                            if (tempColor == null || tempColor == '') {
                              setState(() {
                                colorIsNull = true;
                              });
                            } else if (productColors.contains(tempColor)) {
                              setState(() {
                                colorAllreadyAvilable = true;
                                colorIsNull = false;
                              });
                            } else {
                              setState(() {
                                colorAllreadyAvilable = false;
                                colorIsNull = false;
                                productColors.add(tempColor);
                                tempColor = '';
                              });
                            }
                            if (formkey.currentState.validate()) {
                              formkey.currentState.reset();
                              setState(() {});
                            }
                          },
                        ),
                      ),
                    ),
                    productColors.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(color: Colors.white),
                            padding: EdgeInsets.only(left: 5.0),
                            child: ListView.builder(
                              itemCount: productColors.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      productColors[index].toString(),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () {
                                        setState(() {
                                          productColors.removeAt(index);
                                        });
                                      },
                                    )
                                  ],
                                );
                              },
                            ),
                          )
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
  return Text(text, style: addItemFormTextStyle);
}
