import 'package:cloud_firestore/cloud_firestore.dart';

class OrderDetailModel {
  String orderId;
  String name;
  String streetAddress1;
  String streetAddress2;
  String city;
  String province;
  String postalcode;
  String country;
  String telephone;
  String itemid;
  String userid;
  String subcat;
  String mainCat;
  String size;
  String quantity;
  String color;
  Timestamp dataAndTime;

  OrderDetailModel({
    this.orderId,
    this.name,
    this.streetAddress1,
    this.streetAddress2,
    this.city,
    this.province,
    this.country,
    this.postalcode,
    this.telephone,
    this.color,
    this.itemid,
    this.quantity,
    this.size,
    this.userid,
    this.subcat,
    this.mainCat,
    this.dataAndTime,
  });
}