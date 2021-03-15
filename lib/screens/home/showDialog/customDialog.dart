import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/showDialog/processDialog.dart';
import 'package:sazashopping/services/auth.dart';

class CustomDialog extends StatefulWidget {
  final String title, description, buttonText;

  CustomDialog({this.title, this.description, this.buttonText});

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  bool _loading = false;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return _loading
        ? ProcessDialog()
        : AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 0,
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.all(20),
            title: Text(widget.title),
            content: Text(widget.description),
            actions: [
              FlatButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: Text(
                  'No',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              FlatButton(
                onPressed: () async {
                  setState(() {
                    _loading = true;
                  });
                  
                  try {
                    await _auth.signOut();
                    setState(() {
                      _loading = false;
                    });
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Text(
                  'Yes',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
  }
}
