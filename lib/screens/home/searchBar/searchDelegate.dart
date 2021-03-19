import 'dart:ui';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  static const historyLenth = 10;
  List<String> dataList = [
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

  List<String> recentData = [
    "Banana",
    "Cat",
    "Bag",
    "Shoe",
  ];

  void addSearchTerm(String term) {
    if (recentData.contains(term)) {
      putSerchTermFirst(term);
      return;
    }
    recentData.add(term);
    if (recentData.length > historyLenth) {
      recentData.removeRange(0, recentData.length - historyLenth);
    }
    print(dataList.toString());
  }

  void deleteSearchTerm(String term) {
    recentData.removeWhere((i) => i == term);
  }

  void putSerchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

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
    return Container(
      child: Center(
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggetionList = query.isEmpty
        ? recentData
        : dataList.where((i) => i.startsWith(query)).toList();
    final icon = query.isEmpty ? Icons.history : Icons.search;

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            addSearchTerm(query);
            showResults(context);
          },
          leading: Icon(icon),
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
