import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/main_item_list.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/services/database.dart';

class Home extends StatefulWidget {
  final bool connected;
  final String id;
  final List<String> subItems;
  Home({this.connected, @required this.id, @required this.subItems});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DataBaseService().shopItems,
      child: MainItemList(
        connetion: widget.connected,
        id: widget.id,
        subItems: widget.subItems,
      ),
    );
  }
}
