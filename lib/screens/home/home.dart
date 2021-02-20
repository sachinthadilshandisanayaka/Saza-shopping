import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/menus/constants.dart';
import 'package:sazashopping/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[50],
        appBar: AppBar(
          title: Text(
            'Saza Shopping',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.teal[400],
          elevation: 0.0,
          actions: [
            PopupMenuButton<String>(
              onSelected: choiseAction,
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
        body: Center(
          child: Text('home'),
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
