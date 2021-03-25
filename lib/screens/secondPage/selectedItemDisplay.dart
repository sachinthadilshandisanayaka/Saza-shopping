import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/shared/clipPath/messageClipPath.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/string.dart';

class SelectedItemDisplay extends StatelessWidget {
  final MainItems mainItems;
  SelectedItemDisplay({@required this.mainItems});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: secondAppBarColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: secondAppBarColor,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 5),
              child: IconButton(
                icon: Icon(Icons.shopping_bag_outlined),
                onPressed: () {},
              ),
            )
          ],
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
                  Container(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20.0, left: 5.0, right: 5.0),
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
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10.0, bottom: 10.0, top: 0),
                          // decoration: defaultBoxDecoration,
                          child: Text(
                            this.mainItems.quantity.toString() + ' avalible',
                            style: TextStyle(fontFamily: 'Montserrat'),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Price',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                Text(
                                  srilankaRuppes + ' ' + this.mainItems.price,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: appBarColor,
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          // decoration: defaultBoxDecoration,
                          child: Text(
                            'Material'
                                    ' : ' +
                                this.mainItems.material,
                            style: TextStyle(fontFamily: 'Montserrat'),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: OutlinedButton.icon(
                        icon: Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.amber[700],
                        ),
                        label: Text(
                          "Add to basket",
                          style: TextStyle(
                            color: Colors.amber[700],
                            letterSpacing: 2,
                            fontFamily: 'OpenSands',
                            fontSize: 15,
                          ),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          side:
                              BorderSide(width: 2.0, color: Colors.amber[700]),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: RaisedButton(
                          padding: EdgeInsets.all(13),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          color: appBarColor,
                          onPressed: () {},
                          child: Text(
                            'Buy',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2,
                              fontFamily: 'OpenSands',
                              fontSize: 15,
                              shadows: [
                                Shadow(
                                    color: Colors.black45,
                                    blurRadius: 3,
                                    offset: Offset(0, 1))
                              ],
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
