import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/orderModel.dart';
import 'package:sazashopping/models/user.dart';
import 'package:sazashopping/screens/purchase/purchaseItemList.dart';
import 'package:sazashopping/services/orderDatabase.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/loading.dart';

class PurchaseItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<Users>(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.teal[50],
        appBar: AppBar(
          actions: [],
          centerTitle: true,
          titleSpacing: 2,
          title: Text(
            'PURCHASE',
            style: itemdefaultStyle.copyWith(
              wordSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: appBarColor,
        ),
        body: StreamBuilder<List<OrderDetailModel>>(
            stream: OrderDatabaseService(userid: userId.uid).userOrderStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PurchaseListView(
                  orders: snapshot.data,
                );
              }
              return Loading();
            }),
      ),
    );
  }
}
