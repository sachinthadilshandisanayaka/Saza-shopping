import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/orderModel.dart';
import 'package:sazashopping/screens/adminFeatures/adminHome/orders.dart';
import 'package:sazashopping/services/orderDatabase.dart';
import 'package:sazashopping/shared/colors.dart';

class AdminHome extends StatelessWidget {
  AdminHome();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<OrderDetailModel>>.value(
      value: OrderDatabaseService().orderstream,
      child: Scaffold(
        appBar: AppBar(
          actions: [],
          centerTitle: true,
          title: Text(
            'ODERS',
            style: TextStyle(letterSpacing: 1),
          ),
          backgroundColor: appBarColor,
        ),
        body: OrdersList(),
      ),
    );
  }
}
