import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryDataBaseService {
  final CollectionReference sazaCategoryCollection =
      FirebaseFirestore.instance.collection("mainItemsCategory");

  Stream<QuerySnapshot> get catogories {
    return sazaCategoryCollection.snapshots();
  }
}
