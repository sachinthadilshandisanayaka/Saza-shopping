import 'package:flutter/material.dart';
import 'package:sazashopping/screens/ordering/orderStream.dart';
import 'package:sazashopping/shared/colors.dart';

class OrderItemMainFrame extends StatelessWidget {
  final Map basket;
  OrderItemMainFrame({@required this.basket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        backgroundColor: appBarColor,
      ),
      body: Container(
        color: Colors.teal[50],
        padding: EdgeInsets.all(15),
        child: ShppingForm(
          basket: this.basket,
        ),
      ),
    );
  }
}
