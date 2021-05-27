import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/shared/colors.dart';

class LoadingBegin extends StatefulWidget {
  @override
  _LoadingBeginState createState() => _LoadingBeginState();
}

class _LoadingBeginState extends State<LoadingBegin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultColur,
        elevation: 0,
      ),
      backgroundColor: defaultColur,
      body: Container(
        alignment: Alignment.center,
        color: defaultColur,
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
