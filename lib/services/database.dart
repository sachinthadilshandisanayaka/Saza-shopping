import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});

  final CollectionReference sazaCollection =
      FirebaseFirestore.instance.collection('mainItems');

  Future updateUser(
      String name, String price, String quantity, String material) async {
    return await sazaCollection.doc(uid).set({
      'name': name,
      'price': price,
      'quantity': quantity,
      'material': material
    });
  }

  // get items stream

  Stream<QuerySnapshot> get shopItems {
    return sazaCollection.snapshots();
  }
}
