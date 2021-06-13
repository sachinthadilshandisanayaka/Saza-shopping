import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/shared/constant.dart';

class ItemImageDisplay extends StatefulWidget {
  final MainItems mainItems;
  final bool stockNotAvilabe;
  ItemImageDisplay({@required this.mainItems, @required this.stockNotAvilabe});

  @override
  _ItemImageDisplayState createState() => _ItemImageDisplayState();
}

class _ItemImageDisplayState extends State<ItemImageDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.40,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.fitHeight,
            child: Hero(
              tag: widget.mainItems,
              child: Image.network(
                widget.mainItems.images[0],
                fit: BoxFit.contain,
                loadingBuilder: (context, child, progress) {
                  return progress == null
                      ? child
                      : Center(
                          child: LinearProgressIndicator(),
                        );
                },
              ),
            ),
          ),
          widget.stockNotAvilabe
              ? Positioned(
                  top: 100,
                  left: 18,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 4,
                      color: Colors.red,
                    )),
                    child: Text(
                      'SOLD',
                      style: itemdefaultStyle.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        wordSpacing: 2,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
