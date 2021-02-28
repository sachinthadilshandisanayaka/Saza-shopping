// import 'package:flutter/material.dart';

// class CategeriesList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       elevation: 5,
//       shadowColor: Colors.black,
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: LabelTopItem(),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: showEachItemHorizontalList(),
//           ),
//         ],
//       ),
//     );
//   }

//   // ignore: non_constant_identifier_names
//   Widget LabelTopItem() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Text('Shirts'),
//         Text('MORE'),
//       ],
//     );
//   }

//   Widget showEachItemHorizontalList() {
//     return Container(
//       height: 160.0,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         physics: BouncingScrollPhysics(),
//         children: <Widget>[
//           imageAndDetailSection(),
//           SizedBox(
//             width: 20.0,
//           ),
//           imageAndDetailSection(),
//           SizedBox(
//             width: 20.0,
//           ),
//           imageAndDetailSection(),
//           SizedBox(
//             width: 20.0,
//           ),
//           imageAndDetailSection(),
//           SizedBox(
//             width: 20.0,
//           ),
//           imageAndDetailSection(),
//           SizedBox(
//             width: 20.0,
//           ),
//           imageAndDetailSection(),
//           SizedBox(
//             width: 20.0,
//           ),
//           imageAndDetailSection(),
//           SizedBox(
//             width: 20.0,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget imageAndDetailSection() {
//     return Column(
//       children: <Widget>[
//         Container(
//           height: 100,
//           width: 100,
//           decoration: new BoxDecoration(
//             image: DecorationImage(
//               image: new AssetImage('assets/watch.jpg'),
//               fit: BoxFit.cover,
//             ),
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//         ),
//         SizedBox(
//           height: 10.0,
//         ),
//         Text('Hooded T'),
//         SizedBox(
//           height: 10.0,
//         ),
//         Row(
//           children: <Widget>[
//             Text('290'),
//             Icon(
//               Icons.money,
//               size: 10.0,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
