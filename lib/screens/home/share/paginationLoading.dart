import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/shared/colors.dart';

class PaginationLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: defaultColur,
      child: Column(
        children: [
          CupertinoActivityIndicator(),
          // Container(
          //   color: Colors.white,
          //   width: 10,
          //   height: MediaQuery.of(context).size.height,
          // ),
        ],
      ),
    );
  }
}
