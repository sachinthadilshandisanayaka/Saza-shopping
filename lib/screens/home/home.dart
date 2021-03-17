import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:sazashopping/models/user.dart';
import 'package:sazashopping/screens/home/home_title.dart';
import 'package:sazashopping/screens/home/main_item_list.dart';
import 'package:sazashopping/screens/home/menus/constants.dart';
import 'package:sazashopping/screens/home/showDialog/customDialog.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/screens/home/showDialog/newDialog.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/shared/colors.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<Users>(context);
    return StreamProvider<QuerySnapshot>.value(
      value: DataBaseService(uid: _user.uid).shopItems,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: appBarColor, // here
          appBar: AppBar(
            backgroundColor: appBarColor,
            elevation: 0,
            centerTitle: true,
            title: HomeTitle(),
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
          body: Builder(
            builder: (BuildContext context) {
              return OfflineBuilder (
                connectivityBuilder: (BuildContext context,
                    ConnectivityResult connectivity, Widget child) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                      
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      child,
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        height: 32.0,
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.bounceInOut,
                          color: connected ? null : Colors.red,
                          child: connected
                              ? null
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'OFFLINE',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    SizedBox(
                                      width: 12.0,
                                      height: 12.0,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.0,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                        ),
                      ),
                    ],
                  );
                },
                child: MainItemList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
