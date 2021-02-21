import 'dart:ui';

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      // appBar: AppBar(
      //   backgroundColor: Colors.teal[400],
      //   elevation: 0.0,
      //   title: Text(
      //     'Sign In',
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
      //         'Register',
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
                          email = val;
                        });
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
                        color: Colors.blue[400],
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {},
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    FlatButton(
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
      ),
    );
  }
}
