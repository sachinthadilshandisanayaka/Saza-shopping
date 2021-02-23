import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class MainItemList extends StatefulWidget {
  @override
  _MainItemListState createState() => _MainItemListState();
}

class _MainItemListState extends State<MainItemList> {
  @override
  Widget build(BuildContext context) {
    final mainItemList = Provider.of<QuerySnapshot>(context);
    // print(mainItemList);

    for (var doc in mainItemList.docs) {
      print(doc.data());
    }

    return Container();
  }
}
