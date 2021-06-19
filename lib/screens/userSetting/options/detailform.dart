import 'package:flutter/material.dart';
import 'package:sazashopping/models/userShippingDetails.dart';
import 'package:sazashopping/screens/userSetting/options/subForm.dart';
import 'package:sazashopping/services/userDetailDatabase.dart';
import 'package:sazashopping/shared/loading.dart';

class DetailForm extends StatelessWidget {
  final String uid;
  DetailForm({this.uid});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserShppingDetail>(
        stream: UserDetailDataBaseService(useiId: this.uid).userdetailStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ShowingForm(
              userShppingDetail: snapshot.data,
              uid: this.uid,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('error is occure'),
            );
          }
          return Loading();
        });
  }
}
