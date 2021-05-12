import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sazashopping/models/category.dart';

class CategoryDataBaseService {
  final CollectionReference sazaCategoryCollection =
      FirebaseFirestore.instance.collection('mainItemsCategory');

  List<CatogeryItems> _categeryListFromSnapSot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return CatogeryItems(
        name: doc.id ?? '',
        category: List.from(doc.data()['name']),
      );
    }).toList();
  }

  Stream<List<CatogeryItems>> get catogories {
    return sazaCategoryCollection
        .snapshots()
        .map((i) => _categeryListFromSnapSot(i));
  }
}
