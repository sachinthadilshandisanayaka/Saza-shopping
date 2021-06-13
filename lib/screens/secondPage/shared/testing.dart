// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Flexible(
//       flex: 1,
//       child: Text(
//         'Color',
//         style: itemdefaultStyle,
//       ),
//     ),
//     widget.mainItems.color.length != 0
//         ? Flexible(
//             flex: 1,
//             child: DropdownButtonFormField(
//               elevation: 0,
//               value: selecteColor,
//               hint: Text(
//                 'choose one',
//                 style: itemdefaultStyle,
//               ),
//               isExpanded: true,
//               onChanged: (value) {
//                 setState(() {
//                   selecteColor = value;
//                 });
//               },
//               onSaved: (value) {
//                 setState(() {
//                   selecteColor = value;
//                 });
//               },
//               validator: (String value) {
//                 if (value.isEmpty) {
//                   return "can't empty";
//                 } else {
//                   return null;
//                 }
//               },
//               items: widget.mainItems.color
//                   .map((String getcolor) {
//                 return DropdownMenuItem(
//                   value: getcolor,
//                   child: Text(
//                     getcolor,
//                     style: inputFormTextStyle,
//                   ),
//                 );
//               }).toList(),
//             ),
//             // child: DropDownFormField(
//             //   titleText: 'Color',
//             //   hintText: 'choose one',
//             //   value: color,
//             //   onSaved: (value) {
//             //     setState(() {
//             //       color = value;
//             //     });
//             //   },
//             //   onChanged: (value) {
//             //     setState(() {
//             //       color = value;
//             //     });
//             //   },
//             //   dataSource: widget.mainItems.color
//             //       .map((String getcolor) {
//             //     return ({
//             //       "display": getcolor,
//             //       "value": getcolor,
//             //     });
//             //   }).toList(),
//             //   textField: 'display',
//             //   valueField: 'value',
//             // ),
//           )
//         : Flexible(
//             flex: 1,
//             child: SizedBox(
//               child: Container(
//                 padding: EdgeInsets.all(5),
//                 child: Text(
//                   'no colors',
//                   style: itemdefaultStyle.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red[400]),
//                 ),
//               ),
//             ),
//           ),
//   ],
// ),
