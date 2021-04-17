import 'package:flutter/material.dart';
import 'package:sazashopping/screens/third_page/showItems.dart';

Route createThirdPageRoute(String uid, String itemname) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          SelectedMoreItems(
            itemname: itemname,
          ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset(0.0, 0.0);
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}
