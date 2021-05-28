import 'package:flutter/material.dart';
import 'package:sazashopping/shared/clipPath.dart';

Widget cliPath({BuildContext context}) {
  return Stack(
    children: <Widget>[
      ClipPath(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          color: Colors.blueGrey,
        ),
        clipper: CustomClipPath(),
      ),
      Positioned(
        bottom: 8,
        left: MediaQuery.of(context).size.width * 0.35,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/splash.png'),
          radius: 50,
        ),
      ),
    ],
  );
}
