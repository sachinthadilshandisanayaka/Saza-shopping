import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryDataBaseService {
  final CollectionReference sazaCategoryCollection =
      FirebaseFirestore.instance.collection("mainItemsCategory");

  List<String> _categeryListFromSnapSot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return doc.id;
    });
  }

  Stream<List<String>> get catogories {
    return sazaCategoryCollection
        .snapshots()
        .map((i) => _categeryListFromSnapSot(i));
  }
}
