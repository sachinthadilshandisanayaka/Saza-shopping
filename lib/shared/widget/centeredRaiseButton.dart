import 'package:flutter/material.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';

class RaiseButtonCenter extends StatefulWidget {
  final VoidCallback pressBottonFuntion;
  final String buttonLable;
  RaiseButtonCenter(
      {@required this.pressBottonFuntion, @required this.buttonLable});

  @override
  _RaiseButtonCenterState createState() => _RaiseButtonCenterState();
}

class _RaiseButtonCenterState extends State<RaiseButtonCenter> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: RaisedButton(
          padding: EdgeInsets.all(13),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          color: appBarColor,
          onPressed: () => widget.pressBottonFuntion(),
          child: Text(
            widget.buttonLable,
            style: buybuttonStyle,
          ),
        ),
      ),
    );
  }
}
