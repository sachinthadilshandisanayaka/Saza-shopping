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
        : SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return PurchaseCard(
                  order: this.orders[index],
                );
              },
            ),
          );
  }
}
