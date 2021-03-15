import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/catogeries/catogery_tile.dart';
import 'package:sazashopping/shared/colors.dart';

class CatogeriesHorizontalTile extends StatefulWidget {
  @override
  _CatogeriesHorizontalTileState createState() =>
      _CatogeriesHorizontalTileState();
}

class _CatogeriesHorizontalTileState extends State<CatogeriesHorizontalTile> {
  ScrollController _scrollController = ScrollController();
  List<MainItems> getListItems;
  int maxLegnth = 4;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        _getMoreData();
      }
    });
  }

  _getMoreData() {
    setState(() {
      maxLegnth += maxLegnth;
    });
  }

  @override
  Widget build(BuildContext context) {
    final shopItems = Provider.of<List<MainItems>>(context) ?? [];
    setState(() {
      getListItems = shopItems;
    });

    return Container(
      height: 250.0,
      color: backgroudColor, // here
      child: ListView.builder(
        controller: _scrollController,
        itemCount: shopItems.length > 5
            ? shopItems.sublist(0, 4).length
            : shopItems.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return shopItems.length == 0
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.teal[200]),
                )
              : Container(
                  padding: EdgeInsets.only(bottom: 4),
                  margin: EdgeInsets.only(left: 6, right: 10, bottom: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: itemShadowColor,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ImageAdnDataDislpay(
                    shopItem: shopItems[index],
                  ),
                );
        },
      ),
    );
  }
}
