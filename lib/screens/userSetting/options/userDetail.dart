import 'package:flutter/material.dart';
import 'package:sazashopping/screens/userSetting/options/detailform.dart';
import 'package:sazashopping/shared/colors.dart';

class UserDetails extends StatelessWidget {
  final String uid;
  const UserDetails({this.uid});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [],
          backgroundColor: appBarColor,
        ),
        body: Container(
          color: Colors.teal[50],
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 15,
          ),
          child: DetailForm(
            uid: uid,
          ),
        ),
      ),
    );
  }
}
