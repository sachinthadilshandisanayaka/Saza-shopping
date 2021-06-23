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
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ShowingForm(
                userShppingDetail: snapshot.data,
                uid: this.uid,
              );
            } else if (!snapshot.hasData) {
              return ShowingForm(
                uid: this.uid,
              );
            }
          }

          return Loading();
        });
  }
}
