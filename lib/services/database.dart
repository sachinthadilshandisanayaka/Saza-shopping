import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sazashopping/models/mainItem.dart';

class DataBaseService {
  final String uid;
  final String itemtype;
  int limit;
  DataBaseService({this.uid, this.itemtype, this.limit = 0});

  final CollectionReference sazaCollection =
      FirebaseFirestore.instance.collection('mainItems');

  Future updateItem(String name, String image, String price, int quantity,
      String material) async {
    return await sazaCollection.doc(uid).set({
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'material': material
    });
  }
  // item list from database

  List<MainItems> _itemListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MainItems(
          itemId: doc.id ?? '',
          name: doc.data()['name'] ?? '',
          image: doc.data()['image'] ?? '',
          price: doc.data()['price'] ?? '',
          quantity: doc.data()['quantity'] ?? 0,
          material: doc.data()['material'] ?? '');
    }).toList();
  }

  // get items stream
  Stream<List<MainItems>> get dynamicItemlenght {
    return sazaCollection
        .doc(uid)
        .collection(itemtype)
        .snapshots()
        .map((d) => _itemListFromSnapShot(d));
  }

  Stream<List<MainItems>> get dynamicItem {
    return sazaCollection
        .doc(uid)
        .collection(itemtype)
        .limit(limit == 0 ? 3 : limit)
        .snapshots()
        .map((d) => _itemListFromSnapShot(d));
  }

  Stream<QuerySnapshot> get shopItems {
    return sazaCollection.snapshots();
  }
}
