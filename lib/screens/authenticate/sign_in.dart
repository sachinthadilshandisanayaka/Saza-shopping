import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sazashopping/screens/authenticate/shared/clipPath.dart';
import 'package:sazashopping/services/auth.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/errorMessageShow.dart';
import 'package:sazashopping/shared/loading.dart';
import 'package:sazashopping/shared/widget/formHeaderText.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email;
  String password;
  String _error;

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
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
                    cliPath(context: context, color: Colors.teal[400]),
                    ErrorMessages(
                      message: _error,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 20),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 5),
                        decoration: formBoxDecoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            headerText(name: 'Sign In'),
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
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter the Email' : null,
                                    decoration: textinputDecoration.copyWith(
                                        labelText: 'Email'),
                                    onChanged: (val) {
                                      setState(() {
                                        email = val;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  TextFormField(
                                    validator: (val) => val.isEmpty
                                        ? 'Enter the Password'
                                        : null,
                                    obscureText: true,
                                    decoration: textinputDecoration.copyWith(
                                        labelText: 'Password'),
                                    onChanged: (val) {
                                      setState(() {
                                        password = val;
                                      });
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
                                      color: Colors.teal[400],
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          try {
                                            setState(() {
                                              _loading = true;
                                            });
                                            dynamic result = await _auth
                                                .signInWithEmailAndPassword(
                                                    email, password);
                                            print('User id : ' + result);
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
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    onPressed: () {
                                      widget.toggleView();
                                    },
                                    child: Text(
                                      'Create a new account',
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
