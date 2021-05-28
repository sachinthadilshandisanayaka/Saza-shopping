import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/test/test_three.dart';

class TestTwo extends StatefulWidget {
  @override
  _TestTwoState createState() => _TestTwoState();
}

class _TestTwoState extends State<TestTwo> {
  @override
  Widget build(BuildContext context) {
    var result = Provider.of<List<String>>(context) ?? [];
    for (var i in result) {
      print('---- 01 :' + i.toString());
    }
    return TestThree();
  }
}
