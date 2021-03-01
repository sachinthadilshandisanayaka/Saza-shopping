import 'dart:ui';

import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final dataList = [
    "Apple",
    "Banana",
    "Cat",
    "Bag",
    "Shoe",
    "Purse",
    "Cap",
    "Cup",
    "Phone",
    "Marks",
    "Pensil",
    "Pen",
    "Brush",
    "Doll",
  ];

  final recentData = [
    "Banana",
    "Cat",
    "Bag",
    "Shoe",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggetionList = query.isEmpty
        ? recentData
        : dataList.where((i) => i.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          // onTap: () {
          //   showResults(context);
          // },
          leading: Icon(Icons.storefront_sharp),
          title: RichText(
            text: TextSpan(
              text: suggetionList[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggetionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: suggetionList.length,
    );
  }
}
