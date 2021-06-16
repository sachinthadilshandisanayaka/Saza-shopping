import 'package:flutter/material.dart';
import 'package:sazashopping/screens/ordering/orderStream.dart';
import 'package:sazashopping/shared/colors.dart';

class OrderItemMainFrame extends StatelessWidget {
  final Map basket;
  final List<String> images;
  OrderItemMainFrame({@required this.basket, @required this.images});

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
          child: ShppingForm(
            basket: this.basket,
            images: this.images,
          ),
        ),
      ),
    );
  }
}
