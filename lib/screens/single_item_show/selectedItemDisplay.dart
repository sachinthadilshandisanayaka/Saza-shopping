import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/shared/colors.dart';

class SelectedItemDisplay extends StatelessWidget {
  final MainItems mainItems;
  final String imageUrl;
  SelectedItemDisplay({@required this.mainItems, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appBarColor,
          actions: [],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.40,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Hero(
                    tag: mainItems,
                    child: Image.network(this.imageUrl),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text(this.mainItems.name),
                      Text(this.mainItems.price),
                      Text(this.mainItems.material),
                      Text(this.mainItems.quantity.toString()),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
