import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/screens/authenticate/shared/clipPath.dart';
import 'package:sazashopping/services/auth.dart';
import 'package:sazashopping/services/backetDatabase.dart';
import 'package:sazashopping/shared/errorMessageShow.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/loading.dart';
import 'package:sazashopping/shared/widget/formHeaderText.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String _error;
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              backgroundColor: Colors.teal[50],
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    cliPath(context: context, color: Colors.blueGrey),
                    ErrorMessages(
                      message: _error,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 10),
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                        decoration: formBoxDecoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            headerText(name: 'Sign Up'),
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
                                      return val.trim().isEmpty
                                          ? 'Enter email'
                                          : null;
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
                                      padding: EdgeInsets.all(15),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      color: Colors.blueGrey,
                                      child: Text(
                                        'Sign up',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            _loading = true;
                                          });
                                          try {
                                            User result = await _auth
                                                .registerWithEmailAndPassword(
                                                    email, password);
                                            await BasketDataBaseService(
                                                    userid: result.uid)
                                                .addBasketNewUser();
                                            print('User id : ' + result.uid);
                                          } catch (e) {
                                            setState(() {
                                              _error = e.message;
                                              _loading = false;
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
                                    child: Text(
                                      'Login to the account',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
