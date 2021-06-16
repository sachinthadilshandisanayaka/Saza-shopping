import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sazashopping/models/basket.dart';

class BasketDataBaseService {
  final String userid;
  final String basketId;
  final Basket basketModel;
  BasketDataBaseService({this.userid, this.basketModel, this.basketId});
  final CollectionReference basketCollection =
      FirebaseFirestore.instance.collection('basketItems');

  Future updateItem() async {
    return await basketCollection.doc(basketId).update({
      'userid': basketModel.userid,
      'itemid': basketModel.itemid,
      'itemName': basketModel.itemName,
      'mainCat': basketModel.mainCat,
      'subcat': basketModel.subcat,
      'quantity': basketModel.quantity,
      'color': basketModel.color,
      'size': basketModel.size,
    });
  }

  Future addBasket() async {
    return await basketCollection.doc().set({
      'userid': basketModel.userid,
      'itemid': basketModel.itemid,
      'itemName': basketModel.itemName,
      'mainCat': basketModel.mainCat,
      'subcat': basketModel.subcat,
      'quantity': basketModel.quantity,
      'color': basketModel.color,
      'size': basketModel.size,
    });
  }

  Future deleteBasket() async {
    return await basketCollection.doc(basketId).delete();
  }

  List<Basket> basketSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Basket(
        basketId: doc.id ?? '',
        userid: doc.data()['userid'] ?? '',
        itemid: doc.data()['itemid'] ?? '',
        itemName: doc.data()['itemName'] ?? '',
        mainCat: doc.data()['mainCat'] ?? '',
        subcat: doc.data()['subcat'] ?? '',
        quantity: doc.data()['quantity'] ?? '',
        color: doc.data()['color'] ?? '',
        size: doc.data()['size'] ?? '',
      );
    }).toList();
  }

  Stream<List<Basket>> get basketStorage {
    return basketCollection
        .where('userid', isEqualTo: userid)
        .snapshots()
        .map((i) => basketSnapshot(i));
  }
}
