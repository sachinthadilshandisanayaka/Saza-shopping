import 'package:flutter/material.dart';
import 'package:sazashopping/screens/additems/itemAdd.dart';
import 'package:sazashopping/services/categoryCollection.dart';

class WrapperAdditem extends StatefulWidget {
  @override
  _WrapperAdditemState createState() => _WrapperAdditemState();
}

class _WrapperAdditemState extends State<WrapperAdditem> {
  List<String> productSubCategory = new List();
  Map<String, String> productCategories = new Map();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: CategoryDataBaseService().catogories,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Column(
              children: [
                Text('Loading...'),
                CircularProgressIndicator(),
              ],
            ),
          );
        } else {
          for (var category in snapshot.data) {
            for (var ct in category.category) {
              if (!productSubCategory.contains(ct)) {
                productCategories[ct] = category.name.toString();
                productSubCategory.add(ct.toString() ?? '');
              }
            }
          }
        }
        return ItemAdding(
          subCategory: productSubCategory,
          mainCategories: productCategories,
        );
      },
    );
  }
}
