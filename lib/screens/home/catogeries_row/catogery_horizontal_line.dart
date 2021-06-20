import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/home/catogeries_row/imageContainer.dart';
import 'package:sazashopping/screens/home/share/loading.dart';
import 'package:sazashopping/shared/colors.dart';

class CatogeriesHorizontalTile extends StatefulWidget {
  final String type;
  final String id;
  final bool connection;
  final List<MainItems> mainitems;
  CatogeriesHorizontalTile({
    @required this.type,
    @required this.mainitems,
    @required this.connection,
    @required this.id,
  });
  @override
  _CatogeriesHorizontalTileState createState() =>
      _CatogeriesHorizontalTileState();
}

class _CatogeriesHorizontalTileState extends State<CatogeriesHorizontalTile> {
  ScrollController _scrollController = ScrollController();
  int maxlength;
  int paginationLenght;
  bool ispagination = false;
  bool isminimumvale = false;
  @override
  void initState() {
    super.initState();
    paginationLenght = 5;
    maxlength = widget.mainitems.length;
    if (maxlength <= paginationLenght) {
      setState(() {
        paginationLenght = maxlength;
        isminimumvale = true;
      });
    }

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (paginationLenght <= widget.mainitems.length) {
          _getMoreData();
        } else {
          setState(() {
            ispagination = true;
          });
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
      paginationLenght = paginationLenght + 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.0,
      color: backgroudColor,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: isminimumvale ? paginationLenght : paginationLenght + 1,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (ispagination) {
            return SizedBox(
              width: 2,
            );
          } else if (index == paginationLenght) {
            return horisantalLoading();
          }
          return ImageTile(
            connection: true,
            mainItems: widget.mainitems[index],
          );
        },
      ),
    );
  }
}
