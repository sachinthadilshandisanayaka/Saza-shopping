import 'package:flutter/material.dart';
import 'package:sazashopping/models/orderModel.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/orderState.dart';
import 'package:sazashopping/shared/testStyles.dart';

class PurchaseCard extends StatelessWidget {
  final OrderDetailModel order;
  PurchaseCard({this.order});

  @override
  Widget build(BuildContext context) {
    final cardHeight = MediaQuery.of(context).size.height * 0.25;
    final cardWidth = MediaQuery.of(context).size.width * 0.80;
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        left: 9,
        right: 9,
      ),
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: itemShadowColor,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: cardWidth * 0.45,
              height: cardHeight * 0.95,
              margin: EdgeInsets.only(left: 0),
              child: Hero(
                tag: order,
                child: Image.network(
                  order.images[0],
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, progress) {
                    return progress == null ? child : LinearProgressIndicator();
                  },
                ),
              ),
            ),
            Container(
              width: cardWidth * 0.53,
              padding: EdgeInsets.all(2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    order.itemName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: nameStyle,
                    softWrap: false,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Quantity',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: itemdefaultStyle,
                        softWrap: false,
                      ),
                      Text(
                        order.quantity,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: itemdefaultStyle,
                        softWrap: false,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Color',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: itemdefaultStyle,
                        softWrap: false,
                      ),
                      Text(
                        order.color,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: itemdefaultStyle,
                        softWrap: false,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  OrderState.notShipped == order.orderState
                      ? SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Date',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: itemdefaultStyle,
                              softWrap: false,
                            ),
                            Text(
                              order.shippedDateAndTime
                                      .toDate()
                                      .year
                                      .toString() +
                                  ' - ' +
                                  order.shippedDateAndTime
                                      .toDate()
                                      .month
                                      .toString() +
                                  ' - ' +
                                  order.shippedDateAndTime
                                      .toDate()
                                      .day
                                      .toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: itemdefaultStyle,
                              softWrap: false,
                            ),
                          ],
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: cardWidth * 0.54,
                    padding: EdgeInsets.all(10),
                    color: OrderState.notShipped == order.orderState
                        ? Colors.orange
                        : Colors.teal,
                    child: Text(
                      order.orderState,
                      textAlign: TextAlign.center,
                      style: itemdefaultStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          wordSpacing: 2,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
