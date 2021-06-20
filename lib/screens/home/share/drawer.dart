import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/user.dart';
import 'package:sazashopping/models/userShippingDetails.dart';
import 'package:sazashopping/screens/adminFeatures/additems/itemAddMainFrame.dart';
import 'package:sazashopping/screens/adminFeatures/adminHome/AdminHome.dart';
import 'package:sazashopping/screens/basket/basketMainFrame.dart';
import 'package:sazashopping/screens/home/menus/constants.dart';
import 'package:sazashopping/screens/purchase/purchaseOrders.dart';
import 'package:sazashopping/screens/userSetting/settingController.dart';
import 'package:sazashopping/services/userDetailDatabase.dart';
import 'package:sazashopping/shared/colors.dart';

class DrawerShowing extends StatelessWidget {
  final String username = 'user';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return StreamBuilder<UserShppingDetail>(
        stream: UserDetailDataBaseService(useiId: user.uid).userdetailStream,
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.active) {
          // if (snapshot.hasData) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                    color: appBarColor,
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Positioned(
                        top: 3,
                        left: 85,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/splash.png'),
                          backgroundColor: Colors.white,
                          radius: 50,
                        ),
                      ),
                      Positioned(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            snapshot.hasData ? snapshot.data.name : username,
                            style: TextStyle(
                              fontFamily: 'Baloo2',
                              fontSize: 19,
                              wordSpacing: 1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  itemCount: Constants.choices.length,
                  itemBuilder: (context, index) {
                    dynamic icon;
                    if (Constants.choices[index] == Constants.additem) {
                      icon = FontAwesomeIcons.puzzlePiece;
                    } else if (Constants.choices[index] == Constants.setting) {
                      icon = FontAwesomeIcons.cog;
                    } else if (Constants.choices[index] == Constants.orders) {
                      icon = FontAwesomeIcons.dolly;
                    } else if (Constants.choices[index] == Constants.purchase) {
                      icon = FontAwesomeIcons.store;
                    } else if (Constants.choices[index] == Constants.logout) {
                      icon = FontAwesomeIcons.signOutAlt;
                    } else if (Constants.choices[index] == Constants.basket) {
                      icon = FontAwesomeIcons.shoppingCart;
                    }
                    return ListTile(
                      leading: Icon(icon),
                      onTap: () async {
                        if (Constants.choices[index] == Constants.additem) {
                          //
                          await Navigator.push(
                            context,
                            new PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        ItemAddMainFrame(),
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
                          //
                          // await Navigator.push(
                          //     context,
                          //     new MaterialPageRoute(
                          //         builder: (context) => ItemAddMainFrame()));
                        } else if (Constants.choices[index] ==
                            Constants.setting) {
                          await Navigator.push(
                            context,
                            new PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        SettingOptionDisplay(
                                          userId: user.uid,
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
                          // await Navigator.push(
                          //   context,
                          //   new MaterialPageRoute(
                          //     builder: (context) => SettingOptionDisplay(
                          //       userId: user.uid,
                          //     ),
                          //   ),
                          // );
                        } else if (Constants.choices[index] ==
                            Constants.orders) {
                          await Navigator.push(
                            context,
                            new PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        AdminHome(),
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
                          // await Navigator.push(
                          //     context,
                          //     new MaterialPageRoute(
                          //         builder: (context) => AdminHome()));
                        } else if (Constants.choices[index] ==
                            Constants.purchase) {
                          await Navigator.push(
                            context,
                            new PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        PurchaseItems(),
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
                          // await Navigator.push(
                          //     context,
                          //     new MaterialPageRoute(
                          //         builder: (context) => PurchaseItems()));
                        } else if (Constants.choices[index] ==
                            Constants.logout) {
                        } else if (Constants.choices[index] ==
                            Constants.basket) {
                          await Navigator.push(
                            context,
                            new PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        BasketFrame(),
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
                          // await Navigator.push(
                          //     context,
                          //     new MaterialPageRoute(
                          //         builder: (context) => BasketFrame()));
                        }
                      },
                      title: Text(
                        Constants.choices[index],
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          wordSpacing: 1,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
          // }
        });
  }
}
