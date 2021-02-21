import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sazashopping/services/auth.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String _error;

  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
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
      );
    }
    return SizedBox(
      height: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      // appBar: AppBar(
      //   backgroundColor: Colors.teal[400],
      //   elevation: 0.0,
      //   title: Text(
      //     'Sign Up',
      //     style: TextStyle(
      //       letterSpacing: 2.0,
      //       fontFamily: 'Baloo2',
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   actions: <Widget>[
      //     FlatButton.icon(
      //       icon: Icon(
      //         Icons.person,
      //         color: Colors.white,
      //       ),
      //       label: Text(
      //         'Sign In',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontFamily: 'Baloo2',
      //         ),
      //       ),
      //       onPressed: () {
      //         widget.toggleView();
      //       },
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showAlert(),
              SizedBox(
                height: 5.0,
              ),
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        isDense: true,
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        isDense: true,
                      ),
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Conform Password',
                        isDense: true,
                      ),
                      validator: (val) {
                        return val != password ? 'Password is not same' : null;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.purple[400],
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
      ),
    );
  }
}
