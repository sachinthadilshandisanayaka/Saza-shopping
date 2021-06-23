import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sazashopping/models/userShippingDetails.dart';

class UserDetailDataBaseService {
  final String useiId;
  final UserShppingDetail userDetail;
  UserDetailDataBaseService({this.useiId, this.userDetail});
  final CollectionReference detailCollection =
      FirebaseFirestore.instance.collection('userDetails');

  Future addDetailsNewUser() async {
    return await detailCollection.doc(useiId).set({});
  }

  Future updateUserDetail() async {
    return await detailCollection.doc(useiId).update({
      'uid': useiId,
      'name': userDetail.name,
      'streetAddress1': userDetail.streetAddress1,
      'streetAddress2': userDetail.streetAddress2,
      'city': userDetail.city,
      'province': userDetail.province,
      'postalcode': userDetail.postalcode,
      'country': userDetail.country,
      'telephone': userDetail.telephone,
    });
  }

  UserShppingDetail detailSnapshot(DocumentSnapshot snapshot) {
    return UserShppingDetail(
      name: snapshot.data()['name'] ?? '',
      uid: snapshot.data()['uid'] ?? '',
      streetAddress1: snapshot.data()['streetAddress1'] ?? '',
      streetAddress2: snapshot.data()['streetAddress2'] ?? '',
      city: snapshot.data()['city'] ?? '',
      province: snapshot.data()['province'] ?? '',
      postalcode: snapshot.data()['postalcode'] ?? '',
      country: snapshot.data()['country'] ?? '',
      telephone: snapshot.data()['telephone'] ?? '',
    );
  }

  Stream<UserShppingDetail> get userdetailStream {
    return detailCollection
        .doc(useiId)
        .snapshots()
        .map((i) => detailSnapshot(i));
  }
}
