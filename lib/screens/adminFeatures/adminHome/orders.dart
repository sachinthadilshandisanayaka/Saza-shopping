import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/orderModel.dart';
import 'package:sazashopping/screens/adminFeatures/adminHome/orderCard.dart';
import 'package:sazashopping/shared/loading.dart';

class OrdersList extends StatelessWidget {
  final String oState;
  OrdersList({@required this.oState});

  @override
  Widget build(BuildContext context) {
    final ordersList = Provider.of<List<OrderDetailModel>>(context) ?? [];
    return ordersList.length == 0
        ? Loading()
        : Container(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ordersList.length,
                itemBuilder: (context, index) {
                  return ordersList[index].orderState == oState
                      ? OrderCard(
                          oders: ordersList[index],
                          oState: oState,
                        )
                      : SizedBox();
                },
              ),
            ),
          );
  }
}
