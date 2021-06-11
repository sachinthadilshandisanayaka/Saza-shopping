import 'package:flutter/material.dart';
import 'package:sazashopping/screens/adminFeatures/additems/itemAddMainFrame.dart';
import 'package:sazashopping/screens/home/menus/constants.dart';
import 'package:sazashopping/screens/home/showDialog/customDialog.dart';
// import 'package:sazashopping/screens/home/showDialog/newDialog.dart';

Widget popUpMenuButton(BuildContext context) {
  return PopupMenuButton<String>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10.0),
          topLeft: Radius.circular(5.0)),
    ),
    onSelected: (action) async {
      if (action == Constants.logout) {
        CustomDialog(
          description: 'Do you want log out from this account',
          title: 'Log out',
        );
        // showNewDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return CustomDialog(
        //         description: 'Do you want log out from this account',
        //         title: 'Log out',
        //       );
        //     });
      } else if (action == Constants.additem) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ItemAddMainFrame()));
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
  );
}
