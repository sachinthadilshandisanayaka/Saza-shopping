import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';

class TesingDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allShopCat = Provider.of<List<MainItems>>(context) ?? [];
    for (var i in allShopCat) {
      print('----------' + i.itemId.toString());
    }
    return Container(
      child: Text('lenght ' + allShopCat.length.toString()),
    );
  }
}
