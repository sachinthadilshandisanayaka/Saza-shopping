import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sazashopping/models/mainItem.dart';

class DataBaseService {
  final String uid;
  final String itemtype;
  DataBaseService({this.uid, this.itemtype});

  final CollectionReference sazaCollection =
      FirebaseFirestore.instance.collection('mainItems');

  final CollectionReference sazaItems =
      FirebaseFirestore.instance.collection('mainItems');

  Future updateItem(
      String name, String price, int quantity, String material) async {
    return await sazaCollection.doc(uid).set({
      'name': name,
      'price': price,
      'quantity': quantity,
      'material': material
    });
  }
  // item list from database

  List<MainItems> _itemListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MainItems(
          name: doc.data()['name'] ?? '',
          price: doc.data()['price'] ?? '',
          quantity: doc.data()['quantity'] ?? 0,
          material: doc.data()['material'] ?? '');
    }).toList();
  }

  // get items stream

  Stream<List<MainItems>> get dynamicItem {
    return sazaCollection
        .doc(uid)
        .collection(itemtype)
        .snapshots()
        .map((d) => _itemListFromSnapShot(d));
  }

  Stream<QuerySnapshot> get shopItems {
    return sazaCollection.snapshots();
  }
}
