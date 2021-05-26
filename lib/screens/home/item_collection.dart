import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/catogeries/catogery_horizontal_line.dart';
import 'package:sazashopping/screens/third_page/showItems.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';

class ItemTile extends StatelessWidget {
  final String id;
  final String itemname;
  final bool connection;

  ItemTile(
      {@required this.itemname, @required this.connection, @required this.id});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<MainItems>>.value(
      value: DataBaseService(
              mainCategoryName: this.id, subCategeoryName: this.itemname)
          .databaseStoreAllItems,
      child: Material(
        color: backgroudColor, // here
        elevation: 0,
        shadowColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 0),
              padding: EdgeInsets.only(left: 10, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    itemname.toUpperCase(),
                    style: itemsTypeNameDecoration,
                  ),
                  TextButton(
                    onPressed: () {
                      print('selected');
                    },
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      SelectedMoreItems(
                                        id: this.id,
                                        itemname: itemname,
                                      ),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var begin = Offset(1.0, 0.0);
                                var end = Offset(0.0, 0.0);
                                var curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              }),
                        );
                      },
                      child: Text(
                        'MORE',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: appBarColor,
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(primary: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: CatogeriesHorizontalTile(
                id: this.id,
                type: itemname,
                connection: this.connection,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
