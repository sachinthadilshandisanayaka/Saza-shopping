import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sazashopping/models/orderModel.dart';

class OrderDatabaseService {
  final OrderDetailModel orderDetailModel;
  final String itemId;
  final String userid;
  OrderDatabaseService({this.orderDetailModel, this.itemId, this.userid});
  final CollectionReference orderCollection =
      FirebaseFirestore.instance.collection('newOrders');

  Future uploadOrder() async {
    return await orderCollection.doc().set({
      'name': orderDetailModel.name,
      'streetAddress1': orderDetailModel.streetAddress1,
      'streetAddress2': orderDetailModel.streetAddress2,
      'city': orderDetailModel.city,
      'province': orderDetailModel.province,
      'postalcode': orderDetailModel.postalcode,
      'country': orderDetailModel.country,
      'telephone': orderDetailModel.telephone,
      'itemid': orderDetailModel.itemid,
      'userid': orderDetailModel.userid,
      'subcat': orderDetailModel.subcat,
      'mainCat': orderDetailModel.mainCat,
      'size': orderDetailModel.size,
      'quantity': orderDetailModel.quantity,
      'color': orderDetailModel.color,
      'dataAndTime': orderDetailModel.dataAndTime,
      'orderState': orderDetailModel.orderState,
      'images': FieldValue.arrayUnion(orderDetailModel.images),
    });
  }

  Future orderStateUpdate(String state) async {
    return await orderCollection.doc(itemId).update({
      'orderState': state,
    });
  }

  List<OrderDetailModel> _getUserOrder(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return OrderDetailModel(
        orderId: doc.id ?? '',
        name: doc.data()['name'] ?? '',
        streetAddress1: doc.data()['streetAddress1'] ?? '',
        streetAddress2: doc.data()['streetAddress2'] ?? '',
        city: doc.data()['city'] ?? '',
        province: doc.data()['province'] ?? '',
        postalcode: doc.data()['postalcode'] ?? '',
        country: doc.data()['country'] ?? '',
        telephone: doc.data()['telephone'] ?? '',
        itemid: doc.data()['itemid'] ?? '',
        userid: doc.data()['userid'] ?? '',
        subcat: doc.data()['subcat'] ?? '',
        mainCat: doc.data()['mainCat'] ?? '',
        size: doc.data()['size'] ?? '',
        quantity: doc.data()['quantity'] ?? '',
        color: doc.data()['color'] ?? '',
        dataAndTime: doc.data()['dataAndTime'] ?? '',
        orderState: doc.data()['orderState'] ?? '',
        images: List.from(doc.data()['images']) ?? [],
      );
    }).toList();
  }

  Stream<List<OrderDetailModel>> get userOrderStream {
    return orderCollection
        .where('userid', isEqualTo: userid)
        .snapshots()
        .map((val) => _getUserOrder(val));
  }

  List<OrderDetailModel> _getDataFromSnaphot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return OrderDetailModel(
        orderId: doc.id ?? '',
        name: doc.data()['name'] ?? '',
        streetAddress1: doc.data()['streetAddress1'] ?? '',
        streetAddress2: doc.data()['streetAddress2'] ?? '',
        city: doc.data()['city'] ?? '',
        province: doc.data()['province'] ?? '',
        postalcode: doc.data()['postalcode'] ?? '',
        country: doc.data()['country'] ?? '',
        telephone: doc.data()['telephone'] ?? '',
        itemid: doc.data()['itemid'] ?? '',
        userid: doc.data()['userid'] ?? '',
        subcat: doc.data()['subcat'] ?? '',
        mainCat: doc.data()['mainCat'] ?? '',
        size: doc.data()['size'] ?? '',
        quantity: doc.data()['quantity'] ?? '',
        color: doc.data()['color'] ?? '',
        dataAndTime: doc.data()['dataAndTime'] ?? '',
        orderState: doc.data()['orderState'] ?? '',
        images: List.from(doc.data()['images']) ?? [],
      );
    }).toList();
  }

  Stream<List<OrderDetailModel>> get orderstream {
    return orderCollection.snapshots().map((i) => _getDataFromSnaphot(i));
  }
}
