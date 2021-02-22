import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sazashopping/services/auth.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sazashopping/shared/loading.dart';

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

  Widget slideTeansition() {
    if (_error != null) {
      return Container(
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
                  });
                },
              ),
            ],
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
    return _loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.teal[300],
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 100.0),
              child: Column(
                children: <Widget>[
                  slideTeansition(),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sign In',
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
                                validator: (val) =>
                                    val.isEmpty ? 'Enter the Password' : null,
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
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Colors.blue[400],
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(color: Colors.white),
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
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                onPressed: () {
                                  widget.toggleView();
                                },
                                child: Text('Create a new account'),
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
