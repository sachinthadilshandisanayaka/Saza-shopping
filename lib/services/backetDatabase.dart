import 'package:cloud_firestore/cloud_firestore.dart';

class BasketDataBaseService {
  final String userid;
  final Map<String, String> basket;
  BasketDataBaseService({this.userid, this.basket});
  final CollectionReference basketCollection =
      FirebaseFirestore.instance.collection('basketItems');

  Future addBasketNewUser() async {
    return await basketCollection.doc(userid).set({});
  }

  Future updateItem() async {
    return await basketCollection.doc(userid).update({
      'basketArray': FieldValue.arrayUnion([basket])
    });
  }
}
