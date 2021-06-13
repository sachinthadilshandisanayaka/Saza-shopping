import 'package:flutter/material.dart';
import 'package:sazashopping/shared/constant.dart';

class OutLineButtonCenter extends StatelessWidget {
  final Function pressBottonFuntion;
  final String buttonLable;

  OutLineButtonCenter(
      {@required this.buttonLable, @required this.pressBottonFuntion});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: OutlinedButton.icon(
          icon: Icon(
            Icons.shopping_cart_rounded,
            color: Colors.amber[700],
          ),
          label: Text(
            buttonLable,
            style: cartButtonStyle,
          ),
          onPressed: () => pressBottonFuntion,
          style: carElevatedStryle,
        ),
      ),
    );
  }
}
