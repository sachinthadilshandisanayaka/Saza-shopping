import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/user.dart';
import 'package:sazashopping/screens/home/main_item_list.dart';
import 'package:sazashopping/screens/home/menus/constants.dart';
import 'package:sazashopping/screens/home/searchBar/searchDelegate.dart';
import 'package:sazashopping/screens/home/showDialog/customDialog.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/screens/home/showDialog/newDialog.dart';
import 'package:sazashopping/services/database.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<Users>(context);
    return StreamProvider<QuerySnapshot>.value(
      value: DataBaseService(uid: _user.uid).shopItems,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.blueGrey[100],
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[100],
            elevation: 0,
            centerTitle: true,
            title: FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Container(
                  height: 40,
                  padding: EdgeInsets.only(left: 20, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.white,
                  ),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        TextButton(
                          child: Text(
                            'Search you wish...',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w100,
                                fontSize: 15),
                          ),
                          onPressed: () {
                            showSearch(
                                context: context, delegate: DataSearch());
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            showSearch(
                                context: context, delegate: DataSearch());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              PopupMenuButton<String>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(5.0)),
                ),
                onSelected: (action) async {
                  if (action == Constants.logout) {
                    showNewDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialog(
                            description:
                                'Do you want log out from this account',
                            title: 'Log out',
                          );
                        });
                  }
                },
                itemBuilder: (BuildContext context) {
                  return Constants.choices.map((String choise) {
                    return PopupMenuItem<String>(
                      value: choise,
                      child: Text(choise),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          drawer: Drawer(),
          body: MainItemList(),
        ),
      ),
    );
  }
}
