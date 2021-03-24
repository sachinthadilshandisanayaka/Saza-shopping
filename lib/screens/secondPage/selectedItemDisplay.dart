import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/shared/clipPath/messageClipPath.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/string.dart';

class SelectedItemDisplay extends StatelessWidget {
  final MainItems mainItems;
  SelectedItemDisplay({@required this.mainItems});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: appBarColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: appBarColor,
          actions: [],
          centerTitle: true,
          title: Text(
            this.mainItems.name,
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ClipPath(
            clipper: MessageClipper(),
            child: Container(
              decoration: BoxDecoration(color: backgroudColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Hero(
                        tag: mainItems,
                        child: Image.network(
                          this.mainItems.image,
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, progress) {
                            return progress == null
                                ? child
                                : Center(
                                    child: LinearProgressIndicator(),
                                  );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  // decoration: defaultBoxDecoration,
                                  child: Text(
                                    this.mainItems.name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  // decoration: defaultBoxDecoration,
                                  child: Text(
                                    'Material :' + this.mainItems.material,
                                    style: TextStyle(fontFamily: 'Montserrat'),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: defaultBoxDecoration,
                                  child: Text(
                                    srilankaRuppes + ' ' + this.mainItems.price,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.redAccent,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  // decoration: defaultBoxDecoration,
                                  child: Text(
                                    quantityAvilable +
                                        ': ' +
                                        this.mainItems.quantity.toString(),
                                    style: TextStyle(fontFamily: 'Montserrat'),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: itemShadowColor,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ]),
                                  child: IconButton(
                                    icon: Icon(Icons.add_shopping_cart_rounded),
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Add Cart',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
