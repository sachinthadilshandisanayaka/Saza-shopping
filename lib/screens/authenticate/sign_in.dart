import 'package:flutter/material.dart';
import 'package:sazashopping/services/auth.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Sign in to SaZa'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('Sign in anon'),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print("error sign in");
                  } else {
                    print('signed in');
                    print(result);
                  }
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Sign in'),
                onPressed: () async {
                  // dynamic result = await _auth.signInAnon();
                  // if (result == null) {
                  //   print("error sign in");
                  // } else {
                  //   print('signed in');
                  //   print(result);
                  // }
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Sign in'),
                onPressed: () async {
                  // dynamic result = await _auth.signInAnon();
                  // if (result == null) {
                  //   print("error sign in");
                  // } else {
                  //   print('signed in');
                  //   print(result);
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
