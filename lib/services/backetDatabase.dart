import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sazashopping/models/basket.dart';

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

  List<Basket> basketSnapshot(DocumentSnapshot snapshot) {
    List<Basket> basket = [];
    List result = List.from(snapshot.data()['basketArray']);
    for (var i in result) {
      Basket val = new Basket(
        itemid: i['itemid'] ?? '',
        userid: i['userid'] ?? '',
        subcat: i['subcat'] ?? '',
        mainCat: i['mainCat'] ?? '',
        quantity: i['quantity'] ?? '',
        color: i['color'] ?? '',
        size: i['size'] ?? '',
      );
      basket.add(val);
    }
    return basket;
  }

  Stream<List<Basket>> get basketStorage {
    return basketCollection
        .doc(userid)
        .snapshots()
        .map((i) => basketSnapshot(i));
  }
}
