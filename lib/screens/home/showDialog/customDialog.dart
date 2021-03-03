import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/showDialog/processDialog.dart';
import 'package:sazashopping/services/auth.dart';

class CustomDialog extends StatelessWidget {
  final AuthService _auth = AuthService();
  final String title, description, buttonText;

  CustomDialog({this.title, this.description, this.buttonText});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(20),
      title: Text(title),
      content: Text(description),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'No',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
        FlatButton(
          onPressed: () async {
            // await _auth.signOut();
            Navigator.pop(context, true);
            return showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Loging out...',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CircularProgressIndicator(
                          backgroundColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text(
            'Yes',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

//   dialogContext(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Align(
//           alignment: Alignment.center,
//           child: Container(
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(17),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 10.0,
//                   offset: Offset(0.0, 10.0),
//                 )
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Text(
//                   description,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     child: Row(
//                       children: [
//                         FlatButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: Text(
//                             'No',
//                             style: TextStyle(color: Colors.green[400]),
//                           ),
//                         ),
//                         FlatButton(
//                           onPressed: () async {
//                             await _auth.signOut();
//                           },
//                           child: Text(
//                             'Yes',
//                             style: TextStyle(color: Colors.red[400]),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
}
