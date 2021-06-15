import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/orderModel.dart';
import 'package:sazashopping/screens/adminFeatures/adminHome/orderCard.dart';

class OrdersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ordersList = Provider.of<List<OrderDetailModel>>(context) ?? [];
    return ordersList.length == 0
        ? Container(
            child: Center(
              child: Text(
                'No Orders',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ordersList.length,
                itemBuilder: (context, index) {
                  return OrderCard(
                    oders: ordersList[index],
                  );
                },
              ),
            ),
          );
  }
}
