// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sazashopping/screens/home/retrievImage/getImageUrl.dart';

// class RetrievImageFromDataBase extends StatelessWidget {
//   final String image;
//   final String id;
//   RetrievImageFromDataBase({@required this.image, this.id});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getImageUrl(context, this.image, this.id),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           print('image url : ' + snapshot.data.toString());
//           return FittedBox(
//             fit: BoxFit.contain,
//             child: Image.network(
//               snapshot.data,
//               // loadingBuilder: (context, child, progress) {
//               //   return progress == null ? child : LinearProgressIndicator();
//               // },
//               fit: BoxFit.scaleDown,
//             ),
//           );
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: FittedBox(
//               fit: BoxFit.contain,
//               child: Image.asset(
//                 getDefaultImage().toString(),
//                 fit: BoxFit.scaleDown,
//               ),
//             ),
//           );
//         }
//         return FittedBox(
//           fit: BoxFit.fill,
//         );
//       },
//     );
//   }
// }
