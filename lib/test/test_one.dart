import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/services/database.dart';

class TestOne extends StatefulWidget {
  @override
  _TestOneState createState() => _TestOneState();
}

class _TestOneState extends State<TestOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: StreamProvider<List<String>>.value(
          value: DataBaseService().shopItems,
          child: TestOne(),
        ),
      ),
    );
  }
}
