import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sazashopping/shared/constant.dart';

class Loading extends StatelessWidget {
  final String text;
  Loading({this.text = ''});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            text != ''
                ? Text(
                    text,
                    style: itemdefaultStyle,
                  )
                : SizedBox(),
            SpinKitRing(
              size: 60.0,
              color: Colors.teal[300],
            ),
          ],
        ),
      ),
    );
  }
}
