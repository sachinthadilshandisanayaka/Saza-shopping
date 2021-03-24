import 'package:flutter/material.dart';
import 'package:sazashopping/shared/colors.dart';

class NoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appBarColor,
          actions: [],
          centerTitle: true,
          title: Text('No connection'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Check your connection'),
              SizedBox(
                width: 4,
              ),
              Icon(Icons.signal_wifi_off_rounded)
            ],
          ),
        ),
      ),
    );
  }
}
