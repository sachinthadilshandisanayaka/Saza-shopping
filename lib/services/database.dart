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

  Future uploadItem(
      MainItems mainItems, String subCategory, String mainCategory) async {
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

  // item list from database
  List<MainItems> itemListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MainItems(
        itemId: doc.id ?? '',
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

  // List<MainItems> _itemListFromSnapShot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc) {
  //     return MainItems(
  //         itemId: doc.id ?? '',
  //         name: doc.data()['name'] ?? '',
  //         image: doc.data()['image'] ?? '',
  //         price: doc.data()['price'] ?? '',
  //         quantity: doc.data()['quantity'] ?? 0,
  //         material: doc.data()['material'] ?? '');
  //   }).toList();
  // }

  // // get items stream
  // Stream<List<MainItems>> get dynamicItemlenght {
  //   return sazaCollection
  //       .doc(mainItemsDocumentID)
  //       .collection(itemtype)
  //       .snapshots()
  //       .map((d) => _itemListFromSnapShot(d));
  // }

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

  // Stream<List<MainItems>> get dynamicItem {
  //   return sazaCollection
  //       .doc(mainItemsDocumentID)
  //       .collection(itemtype)
  //       .limit(limit == 0 ? 3 : limit)
  //       .snapshots()
  //       .map((d) => _itemListFromSnapShot(d));
  // }

  Stream<QuerySnapshot> get shopItems {
    return sazaCollection.snapshots();
  }
}
