import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/third_page/showItems.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';
import 'catogeries_row/catogery_horizontal_line.dart';

class ItemCollectionEmptyCheck extends StatefulWidget {
  final String id;
  final String itemname;
  final bool connection;
  ItemCollectionEmptyCheck(
      {@required this.itemname, @required this.connection, @required this.id});
  @override
  _ItemCollectionEmptyCheckState createState() =>
      _ItemCollectionEmptyCheckState();
}

class _ItemCollectionEmptyCheckState extends State<ItemCollectionEmptyCheck> {
  @override
  Widget build(BuildContext context) {
    final allShopItems = Provider.of<List<MainItems>>(context) ?? [];
    return allShopItems.length == 0
        ? SizedBox()
        : Material(
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
                        widget.itemname.toUpperCase(),
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
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      SelectedMoreItems(
                                        id: widget.id,
                                        itemname: widget.itemname,
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
                    id: widget.id,
                    type: widget.itemname,
                    connection: widget.connection,
                  ),
                ),
              ],
            ),
          );
  }
}
