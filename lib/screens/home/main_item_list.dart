import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/catogeries/catogeries_list.dart';
import 'package:sazashopping/screens/home/catogeries/offer_item.dart';
// import 'package:sazashopping/screens/home/item_tile.dart';

class MainItemList extends StatefulWidget {
  @override
  _MainItemListState createState() => _MainItemListState();
}

class _MainItemListState extends State<MainItemList> {
  @override
  Widget build(BuildContext context) {
    final shopItems = Provider.of<List<MainItems>>(context);
    print(shopItems);

    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          OfferItems(),
          SizedBox(
            height: 20.0,
          ),
          CategeriesList(),
           SizedBox(
            height: 20.0,
          ),
          TrouserContaioner(),
           SizedBox(
            height: 20.0,
          ),
          WatchContaioner(),
           SizedBox(
            height: 20.0,
          ),
          ShoesContaioner(),
        ],
      ),
    );
  }

  Widget ShirtContaioner() {
    return Container(
      child: Text('image'),
    );
  }
  Widget TrouserContaioner() {
    return Container(
      child: Text('image'),
    );
  }
  Widget WatchContaioner() {
    return Container(
      child: Text('image'),
    );
  }
   Widget ShoesContaioner() {
    return Container(
      child: Text('image'),
    );
  }
}
