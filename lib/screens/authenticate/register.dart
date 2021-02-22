import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sazashopping/services/auth.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sazashopping/shared/constant.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    Timer(Duration(milliseconds: 200), () => _animationController.forward());
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String _error;
  // bool _visible = false;

  Widget slideTeansition() {
    if (_error != null) {
      return Container(
        child: SlideTransition(
          position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
              .animate(_animationController),
          child: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.amber,
            child: Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.error_outline)),
                Expanded(
                  child: AutoSizeText(
                    _error,
                    maxLines: 4,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _error = null;
                      // _visible = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          children: <Widget>[
            slideTeansition(),
            // AnimatedOpacity(
            //   duration: const Duration(milliseconds: 200),
            //   opacity: _visible ? 1.0 : 0.0,
            //   curve: Curves.linearToEaseOut,
            //   child: Container(
            //     color: Colors.amber,
            //     child: Row(
            //       children: <Widget>[
            //         Padding(
            //             padding: const EdgeInsets.only(right: 5.0),
            //             child: Icon(Icons.error_outline)),
            //         Expanded(
            //           child: AutoSizeText(
            //             _error,
            //             maxLines: 3,
            //           ),
            //         ),
            //         IconButton(
            //           icon: Icon(Icons.close),
            //           onPressed: () {
            //             setState(() {
            //               _error = '';
            //               _visible = false;
            //             });
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 0.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                      fontFamily: 'Baloo2',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: textinputDecoration.copyWith(
                            labelText: 'Email',
                          ),
                          onChanged: (val) {
                            setState(() {
                              email = val.trim();
                            });
                          },
                          validator: (val) {
                            return val.trim().isEmpty ? 'Enter email' : null;
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: textinputDecoration.copyWith(
                              labelText: 'Password'),
                          onChanged: (val) {
                            setState(() {
                              password = val.trim();
                            });
                          },
                          validator: (val) {
                            return val.trim().length < 5
                                ? 'Enter password 5+ charactor long'
                                : null;
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: textinputDecoration.copyWith(
                              labelText: 'Conform Password'),
                          validator: (val) {
                            return val != password
                                ? 'Password is not same'
                                : null;
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            color: Colors.purpleAccent,
                            child: Text(
                              'Sign up',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                try {
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password);
                                  print('User id : ' + result);
                                } catch (e) {
                                  setState(() {
                                    _error = e.message;
                                    // _visible = true;
                                    print(_error);
                                  });
                                }
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          onPressed: () {
                            widget.toggleView();
                          },
                          child: Text('Login to the account'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
