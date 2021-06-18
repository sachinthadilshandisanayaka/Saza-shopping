import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sazashopping/models/mainItem.dart';

class ItemsDatabaseService {
  final String uid;
  final String subCategeoryName;
  final String mainCategoryName;
  final int limit;
  final MainItems mainItems;
  ItemsDatabaseService({
    this.mainItems,
    this.uid,
    this.limit = 0,
    this.mainCategoryName,
    this.subCategeoryName,
  });

  final CollectionReference itemCollection =
      FirebaseFirestore.instance.collection('SellingItems');

  Future updateItem() async {
    return await itemCollection.doc(uid).set({
      'name': mainItems.name,
      'mainCat': mainItems.mainCat,
      'subCat': mainItems.subCat,
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

  Future uploadItem() async {
    // await itemCollection.doc(mainCategory).set({});
    return await itemCollection.doc().set({
      'name': mainItems.name,
      'mainCat': mainItems.mainCat,
      'subCat': mainItems.subCat,
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

  List<MainItems> itemListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MainItems(
        itemId: doc.id ?? '',
        mainCat: doc.data()['mainCat'] ?? '',
        subCat: doc.data()['subCat'] ?? '',
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

  Stream<List<MainItems>> get databaseStoreAllItems {
    return itemCollection.snapshots().map((i) => itemListFromSnapShot(i));
  }

  Stream<List<MainItems>> get databaseSubItem {
    return itemCollection
        .where('subCat', isEqualTo: subCategeoryName)
        .snapshots()
        .map((i) => itemListFromSnapShot(i));
  }

  Stream<List<MainItems>> get databaseStoreItemsPagination {
    return itemCollection
        .limit(limit == 0 ? 3 : limit)
        .snapshots()
        .map((i) => itemListFromSnapShot(i));
  }
}
