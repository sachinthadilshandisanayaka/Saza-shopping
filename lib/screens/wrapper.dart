import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/user.dart';
import 'package:sazashopping/screens/authenticate/authenticate.dart';
import 'package:sazashopping/screens/home/tabBarView.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return TabBarWidget();
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_offline/flutter_offline.dart';
// import 'package:provider/provider.dart';
// import 'package:sazashopping/error_ui/onlineCheck.dart';
// import 'package:sazashopping/models/user.dart';
// import 'package:sazashopping/screens/authenticate/authenticate.dart';
// import 'package:sazashopping/screens/home/home.dart';

// class Wrapper extends StatefulWidget {
//   @override
//   _WrapperState createState() => _WrapperState();
// }

// class _WrapperState extends State<Wrapper> {
//   bool connected;

//   _setState(bool state) {
//     connected = state;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<Users>(context);
//     print(user);

//     _checkAuth(bool state) {
//       if (user == null) {
//         return Authenticate();
//       } else {
//         return Home(
//           connected: state,
//         );
//       }
//     }

//     return OfflineBuilder(
//         connectivityBuilder: (BuildContext context,
//             ConnectivityResult connectivity, Widget child) {
//           if (connectivity != ConnectivityResult.none) {
//             _setState(true);
//           } else {
//             _setState(false);
//           }

//           return Stack(
//             fit: StackFit.expand,
//             children: [
//               _checkAuth(connected),
//               Positioned(
//                 left: 0.0,
//                 right: 0.0,
//                 bottom: 0.0,
//                 height: 35.0,
//                 child: ConnectionCheckAndShowInTop(connection: connected),
//               ),
//             ],
//           );
//         },
//         child: _checkAuth(connected));
//   }
// }
