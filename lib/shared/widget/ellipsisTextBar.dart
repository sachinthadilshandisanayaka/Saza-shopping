import 'package:flutter/material.dart';
import 'package:sazashopping/shared/constant.dart';

Widget ellipsisText({String text}) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: itemTileNameDecoration,
    softWrap: false,
  );
}
