import 'package:flutter/material.dart';

Widget bottomRightAlignButton(
    {@required BuildContext context,
    @required String text,
    @required Function buttonClickOperation}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
        onPressed: () => buttonClickOperation(),
      ),
    ),
  );
}
