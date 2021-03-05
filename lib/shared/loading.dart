import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[300],
      child: Center(
        child: SpinKitRing(
          size: 60.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
