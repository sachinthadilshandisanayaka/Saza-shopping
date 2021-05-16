import 'dart:ui';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
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
  int quantity;
  String procudeSizeType;
  List<String> productColors = new List();
  List<String> productSize = new List();
  List<String> productSubCategory = new List();
  Map<String, String> productCategory = new Map();

  Widget displaySelectedCategory(pC) {
    return selectedCategoryBydefault == null ||
            selectedCategoryBydefault.toString().isEmpty
        ? Text('')
        : Text(
            pC[selectedCategoryBydefault].toString() +
                " > " +
                selectedCategoryBydefault.toString(),
            style: TextStyle(
                fontFamily: 'Baloo2',
                color: appBarColor,
                fontWeight: FontWeight.bold),
          );
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
                    Text(
                      'Item name',
                      style: TextStyle(fontFamily: 'Baloo2'),
                    ),
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Category',
                      style: TextStyle(fontFamily: 'Baloo2'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropDownField(
                      controller: categorySelected,
                      hintText: "Select item category",
                      textStyle: TextStyle(fontFamily: 'Baloo2'),
                      enabled: true,
                      items: productSubCategory,
                      itemsVisibleInDropdown: 5,
                      onValueChanged: (value) {
                        setState(() {
                          selectedCategoryBydefault = value;
                        });
                      },
                    ),
                    displaySelectedCategory(productCategory),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Material',
                      style: TextStyle(fontFamily: 'Baloo2'),
                    ),
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Brand',
                      style: TextStyle(fontFamily: 'Baloo2'),
                    ),
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Made in',
                      style: TextStyle(fontFamily: 'Baloo2'),
                    ),
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Quantity Avilable',
                      style: TextStyle(fontFamily: 'Baloo2'),
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
