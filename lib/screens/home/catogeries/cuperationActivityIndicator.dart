import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget cuperationActivityIndicator({@required BuildContext context}) {
  return Container(
    height: 250,
    width: MediaQuery.of(context).size.width,
    child: CupertinoActivityIndicator(),
  );
}
