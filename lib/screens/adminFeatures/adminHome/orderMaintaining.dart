import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/models/orderModel.dart';
import 'package:sazashopping/services/orderDatabase.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';
import 'package:sazashopping/shared/loading.dart';
import 'package:sazashopping/shared/orderState.dart';
import 'package:sazashopping/shared/widget/centeredRaiseButton.dart';

class OrderReview extends StatefulWidget {
  final OrderDetailModel orderDetailModel;
  final String oState;
  OrderReview({@required this.orderDetailModel, this.oState});

  @override
  _OrderReviewState createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReview> {
  bool isLoading;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  setLoading(val) {
    setState(() {
      isLoading = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              actions: [],
              centerTitle: true,
              backgroundColor: appBarColor,
              title: Text(
                'ODER DETAILS',
                style: TextStyle(letterSpacing: 1),
              ),
            ),
            body: Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.all(15),
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Item id'),
                            Text(
                              widget.orderDetailModel.itemid,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Item name'),
                            Text(
                              widget.orderDetailModel.itemName,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Item sub name'),
                            Text(
                              widget.orderDetailModel.subcat,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Buyer'),
                            Text(
                              widget.orderDetailModel.name,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('S.Adress 1'),
                            Text(
                              widget.orderDetailModel.streetAddress1,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('S.Adress 2'),
                            Text(
                              widget.orderDetailModel.streetAddress2,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('City'),
                            Text(
                              widget.orderDetailModel.city,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Province'),
                            Text(
                              widget.orderDetailModel.province,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Country'),
                            Text(
                              widget.orderDetailModel.country,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Postal Code'),
                            Text(
                              widget.orderDetailModel.postalcode,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Telephone'),
                            Text(
                              widget.orderDetailModel.telephone,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Item size'),
                            Text(
                              widget.orderDetailModel.size,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Quantity'),
                            Text(
                              widget.orderDetailModel.quantity,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Item color'),
                            Text(
                              widget.orderDetailModel.color,
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Date'),
                            Text(
                              this
                                  .widget
                                  .orderDetailModel
                                  .dataAndTime
                                  .toDate()
                                  .toString(),
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Shipped aate'),
                            Text(
                              this
                                  .widget
                                  .orderDetailModel
                                  .shippedDateAndTime
                                  .toDate()
                                  .toString(),
                              style: itemdefaultStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  widget.oState == OrderState.notShipped
                      ? RaiseButtonCenter(
                          buttonLable: 'Shipping',
                          pressBottonFuntion: () async {
                            setLoading(true);
                            try {
                              DateTime now = new DateTime.now();
                              Timestamp timestamp = new Timestamp.fromDate(now);
                              await OrderDatabaseService(
                                      itemId:
                                          this.widget.orderDetailModel.orderId)
                                  .orderStateUpdate(
                                OrderState.shipped,
                                timestamp,
                              );
                              setLoading(false);
                            } catch (e) {
                              print(e.message);
                              setLoading(false);
                            }
                            Navigator.of(context).pop();
                          },
                        )
                      : Container(
                          margin: EdgeInsets.only(
                            left: 5,
                            right: 5,
                          ),
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          color: Colors.orange,
                          child: Text(
                            'Shipped',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
  }
}
