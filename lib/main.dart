import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/user.dart';
import 'package:sazashopping/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user, // auth.dart
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
