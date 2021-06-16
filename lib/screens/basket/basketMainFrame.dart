import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/basket.dart';
import 'package:sazashopping/models/user.dart';
import 'package:sazashopping/screens/basket/listView.dart';
import 'package:sazashopping/services/backetDatabase.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/loading.dart';

class BasketFrame extends StatefulWidget {
  @override
  _BasketFrameState createState() => _BasketFrameState();
}

class _BasketFrameState extends State<BasketFrame> {
  GlobalKey _scaffold = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final userid = Provider.of<Users>(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: Scaffold(
        key: _scaffold,
        backgroundColor: Colors.teal[50],
        appBar: AppBar(
          actions: [],
          backgroundColor: appBarColor,
          centerTitle: true,
          title: Text(
            'BASKET',
            style: itemdefaultStyle.copyWith(
              wordSpacing: 4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: StreamBuilder<List<Basket>>(
          stream: BasketDataBaseService(userid: userid.uid).basketStorage,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                if (snapshot.data.length > 0) {
                  return BasketListView(
                    basketList: snapshot.data,
                  );
                } else {
                  return Center(
                    child: Text('no item in basket'),
                  );
                }
              } else if (snapshot.error) {
                return Loading();
              }
            } else {
              return Loading();
            }
            return Loading();
          },
        ),
      ),
    );
  }
}
