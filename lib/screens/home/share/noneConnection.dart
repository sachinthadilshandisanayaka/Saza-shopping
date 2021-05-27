import 'package:flutter/material.dart';
import 'package:sazashopping/shared/colors.dart';

class ConnectionNone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      body: Container(
        color: appBarColor,
        child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Icon(Icons.signal_cellular_connected_no_internet_4_bar_rounded),
                Text(
                  'no connection',
                )
              ],
            )),
      ),
    );
  }
}
