import 'package:flutter/material.dart';

class MessageClipper extends CustomClipper<Path> {
  final double borderRadius = 15;
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    var path = Path();
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, 50);
    path.quadraticBezierTo(width, 0, width - 50, 0);
    path.lineTo(50, 0);
    path.quadraticBezierTo(0, 0, 0, 50);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
