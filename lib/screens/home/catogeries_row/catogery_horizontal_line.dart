import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/catogeries_row/cuperationActivityIndicator.dart';
import 'package:sazashopping/screens/home/catogeries_row/imageContainer.dart';
import 'package:sazashopping/screens/home/share/loading.dart';
import 'package:sazashopping/services/database.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/double.dart';

class CatogeriesHorizontalTile extends StatefulWidget {
  final String type;
  final String id;
  final bool connection;
  CatogeriesHorizontalTile(
      {@required this.type, @required this.connection, @required this.id});
  @override
  _CatogeriesHorizontalTileState createState() =>
      _CatogeriesHorizontalTileState();
}

class _CatogeriesHorizontalTileState extends State<CatogeriesHorizontalTile> {
  ScrollController _scrollController = ScrollController();
  List<MainItems> getListItems;
  int loadedDataLenght = 3;
  bool moreDataAvalible = true;

  final double itemMaxLength = homeScrollItemMaxCount;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (moreDataAvalible) {
          _getMoreData();
        }
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
      loadedDataLenght += 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final allShopItems = Provider.of<List<MainItems>>(context) ?? [];
    final itemDisplayMaxLenght = allShopItems.length < itemMaxLength
        ? allShopItems.length
        : itemMaxLength;

    return StreamBuilder(
      stream: DataBaseService(
                  mainCategoryName: widget.id,
                  subCategeoryName: widget.type,
                  limit: loadedDataLenght)
              .databaseStoreItemsPagination ??
          [],
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          getListItems = snapshot.data;
          return Container(
            height: 280.0,
            color: backgroudColor, // here
            child: ListView.builder(
              controller: _scrollController,
              itemCount: getListItems.length + 1,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == itemDisplayMaxLenght) {
                  moreDataAvalible = false;
                  return SizedBox(
                    width: 2,
                  );
                } else if (index == getListItems.length) {
                  moreDataAvalible = true;
                  return horisantalLoading();
                }
                return imageContainer(
                    connection: true, mainItems: getListItems[index]);
              },
            ),
          );
        }
        return cuperationActivityIndicator(context: context);
      },
    );
  }
}
