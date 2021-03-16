import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/catogeries/catogery_tile.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/shared/colors.dart';

class CatogeriesHorizontalTile extends StatefulWidget {
  final String type;
  final String uid;
  CatogeriesHorizontalTile({@required this.type, this.uid});
  @override
  _CatogeriesHorizontalTileState createState() =>
      _CatogeriesHorizontalTileState();
}

class _CatogeriesHorizontalTileState extends State<CatogeriesHorizontalTile> {
  ScrollController _scrollController = ScrollController();
  List<MainItems> getListItems;
  int maxLegnth = 3;
  int limitLength;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  _getMoreData() {
    setState(() {
      maxLegnth += 3;
    });
    print(maxLegnth.toString());
  }

  @override
  Widget build(BuildContext context) {
    // final shopItems = Provider.of<List<MainItems>>(context) ?? [];

    return StreamBuilder(
      stream: DataBaseService(
                  uid: widget.uid, itemtype: widget.type, limit: maxLegnth)
              .dynamicItem ??
          null,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          getListItems = snapshot.data;
          return Container(
            height: 250.0,
            color: backgroudColor, // here
            child: ListView.builder(
              controller: _scrollController,
              itemCount: getListItems.length + 1,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (getListItems.isEmpty) {
                  return Center(
                    child: Text('No more'),
                  );
                } else if (index == getListItems.length) {
                  print("data" + getListItems.toString());
                  return CupertinoActivityIndicator();
                }
                return Container(
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
                    shopItem: getListItems[index],
                  ),
                );
              },
            ),
          );
        }
        return Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }
}
