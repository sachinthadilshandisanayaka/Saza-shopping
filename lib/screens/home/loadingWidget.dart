import 'package:flutter/material.dart';
import 'package:sazashopping/shared/colors.dart';

class LoadingBegin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      body: Container(
        color: appBarColor,
        child: Center(
          child: Container(
            width: 400,
            height: 400,
            child: Image(
              image: AssetImage('assets/splash.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          //   Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       SizedBox(
          //         width: 40,
          //         child: Center(
          //           child: CircularProgressIndicator(
          //             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
