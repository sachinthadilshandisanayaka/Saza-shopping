import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/main_item_list.dart';
import 'package:sazashopping/screens/home/menus/constants.dart';
import 'package:sazashopping/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MainItems>>.value(
      value: DataBaseService().shopItems,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue[50],
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 1)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.bar_chart_rounded),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      child: Text(
                        "Saza Shopping",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      child: PopupMenuButton<String>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(5.0)),
                        ),
                        onSelected: (action) async {
                          if (action == Constants.logout) {
                            await _auth.signOut();
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
                    )
                  ],
                ),
              ),
            ),
          ),
          body: MainItemList(),
        ),
      ),
    );
  }

  void choiseAction(String action) async {
    if (action == Constants.logout) {
      await _auth.signOut();
    }
  }
}
