import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/user.dart';
import 'package:sazashopping/screens/basket/listView.dart';
import 'package:sazashopping/screens/home/share/loadingWidget.dart';
import 'package:sazashopping/services/backetDatabase.dart';
import 'package:sazashopping/shared/colors.dart';

class BasketFrame extends StatelessWidget {
  // const BasketFrame({ Key? key, @required }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userid = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
      ),
      body: StreamBuilder<Object>(
          stream: BasketDataBaseService(userid: userid.uid).basketStorage,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BasketListView(
                basketList: snapshot.data,
              );
            } else if (snapshot.error) {
              return LoadingBegin();
            }
            return LoadingBegin();
          }),
    );
  }
}
