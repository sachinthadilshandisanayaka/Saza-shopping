import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final CollectionReference sazaCollection =
      FirebaseFirestore.instance.collection('mainItems');
}
