import 'package:flutter/material.dart';
import 'package:sazashopping/models/orderModel.dart';
import 'package:sazashopping/shared/colors.dart';

class OrderCard extends StatelessWidget {
  final OrderDetailModel oders;
  OrderCard({@required this.oders});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: appBarColor, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: <Widget>[
          Text(this.oders.name),
          SizedBox(
            height: 5,
          ),
          Text(this.oders.streetAddress1),
          SizedBox(
            height: 5,
          ),
          Text(this.oders.streetAddress2),
          SizedBox(
            height: 5,
          ),
          Text(this.oders.telephone),
          SizedBox(
            height: 5,
          ),
          Text(this.oders.country),
          SizedBox(
            height: 5,
          ),
          Text(this.oders.itemid),
          SizedBox(
            height: 5,
          ),
          Text(this.oders.subcat),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
