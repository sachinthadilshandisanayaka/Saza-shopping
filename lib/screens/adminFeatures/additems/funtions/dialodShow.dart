import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowingDialog {
  final BuildContext context;
  final String header;
  final String message;
  ShowingDialog({this.context, this.header, this.message});
  Future showingDialog() async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(this.header),
        content: Text(this.message),
        insetAnimationCurve: Curves.elasticIn,
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: false,
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
