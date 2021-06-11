import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sazashopping/models/mainItem.dart';

class DataBaseService {
  final String uid;
  final String subCategeoryName;
  final String mainCategoryName;
  int limit;
  DataBaseService(
      {this.uid, this.limit = 0, this.mainCategoryName, this.subCategeoryName});

  final CollectionReference sazaCollection =
      FirebaseFirestore.instance.collection('mainItems');

  Future updateItem(
      MainItems mainItems, String subCategory, String mainCategory) async {
    return await sazaCollection
        .doc(mainCategory)
        .collection(subCategory)
        .doc(uid)
        .set({
      'name': mainItems.name,
      'material': mainItems.material,
      'gender': mainItems.gender,
      'description': mainItems.description,
      'country': mainItems.country,
      'brand': mainItems.brand,
      'price': mainItems.price,
      'offer': mainItems.offer,
      'quantity': mainItems.quantity,
      'size': FieldValue.arrayUnion(mainItems.size),
      'images': FieldValue.arrayUnion(mainItems.images),
      'color': FieldValue.arrayUnion(mainItems.color),
    });
  }

  Future uploadItem(
      MainItems mainItems, String subCategory, String mainCategory) async {
    await sazaCollection.doc(mainCategory).set({});
    return await sazaCollection
        .doc(mainCategory)
        .collection(subCategory)
        .doc()
        .set({
      'name': mainItems.name,
      'material': mainItems.material,
      'gender': mainItems.gender,
      'description': mainItems.description,
      'country': mainItems.country,
      'brand': mainItems.brand,
      'price': mainItems.price,
      'offer': mainItems.offer,
      'quantity': mainItems.quantity,
      'size': FieldValue.arrayUnion(mainItems.size),
      'images': FieldValue.arrayUnion(mainItems.images),
      'color': FieldValue.arrayUnion(mainItems.color),
    });
  }

  Future deleteItem(String subCategory, String mainCategory, String id) async {
    return await sazaCollection
        .doc(mainCategory)
        .collection(subCategory)
        .doc(id)
        .delete();
  }

  // item list from database
  List<MainItems> itemListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MainItems(
        itemId: doc.id ?? '',
        mainCat: mainCategoryName ?? '',
        subCat: subCategeoryName ?? '',
        name: doc.data()['name'] ?? '',
        material: doc.data()['material'] ?? '',
        gender: doc.data()['gender'] ?? '',
        description: doc.data()['description'] ?? '',
        country: doc.data()['country'] ?? '',
        brand: doc.data()['brand'] ?? '',
        size: List.from(doc.data()['size']) ?? [],
        color: List.from(doc.data()['color']) ?? [],
        images: List.from(doc.data()['images']) ?? [],
        quantity: doc.data()['quantity'] ?? 0,
        offer: doc.data()['offer'] ?? 0.0,
        price: doc.data()['price'] ?? '',
      );
    }).toList();
  }

  // new
  Stream<List<MainItems>> get databaseStoreAllItems {
    return sazaCollection
        .doc(mainCategoryName)
        .collection(subCategeoryName)
        .snapshots()
        .map((i) => itemListFromSnapShot(i));
  }

  // new
  Stream<List<MainItems>> get databaseStoreItemsPagination {
    return sazaCollection
        .doc(mainCategoryName)
        .collection(subCategeoryName)
        .limit(limit == 0 ? 3 : limit)
        .snapshots()
        .map((i) => itemListFromSnapShot(i));
  }

  List<String> _category(QuerySnapshot snapshot) {
    return snapshot.docs.map((val) {
      return val.id.toString();
    }).toList();
  }

  Stream<List<String>> get shopItems {
    return sazaCollection.snapshots().map((i) => _category(i));
  }
}
