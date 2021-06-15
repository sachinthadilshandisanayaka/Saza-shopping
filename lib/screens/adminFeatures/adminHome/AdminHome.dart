import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/orderModel.dart';
import 'package:sazashopping/screens/adminFeatures/adminHome/orders.dart';
import 'package:sazashopping/services/orderDatabase.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/orderState.dart';
import 'package:sazashopping/shared/testStyles.dart';
import 'package:sazashopping/shared/widget/display_text_withStyle.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<OrderDetailModel>>.value(
      value: OrderDatabaseService().orderstream,
      child: DefaultTabController(
        length: OrderState.orderState.length,
        child: Scaffold(
          appBar: AppBar(
            actions: [],
            centerTitle: true,
            title: Text(
              'ODERS',
              style: TextStyle(letterSpacing: 1),
            ),
            backgroundColor: appBarColor,
            bottom: TabBar(
              physics: BouncingScrollPhysics(),
              isScrollable: true,
              indicatorWeight: 6.0,
              indicatorColor: Colors.white,
              tabs: OrderState.orderState.map<Widget>((String oState) {
                return Tab(
                  child: diplayTextWithStyle(
                    text: oState,
                    style: tabBarHeaderNameStyle,
                  ),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
              children: OrderState.orderState.map((String val) {
            return OrdersList(
              oState: val,
            );
          }).toList()),
        ),
      ),
    );
  }
}
