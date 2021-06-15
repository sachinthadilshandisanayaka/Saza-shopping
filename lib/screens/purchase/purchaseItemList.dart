import 'package:flutter/material.dart';
import 'package:sazashopping/models/orderModel.dart';
import 'package:sazashopping/screens/purchase/purchaseTile.dart';

class PurchaseListView extends StatelessWidget {
  final List<OrderDetailModel> orders;
  PurchaseListView({this.orders});

  @override
  Widget build(BuildContext context) {
    return orders.length == 0
        ? Container(
            child: Center(
              child: Text('No Orders'),
            ),
          )
        : Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return PurchaseCard(
                    order: this.orders[index],
                  );
                },
              ),
            ),
          );
  }
}
