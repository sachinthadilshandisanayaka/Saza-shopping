import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/user.dart';
import 'package:sazashopping/models/userShippingDetails.dart';
import 'package:sazashopping/screens/ordering/orderForm.dart';
import 'package:sazashopping/services/userDetailDatabase.dart';
import 'package:sazashopping/shared/loading.dart';

class ShppingForm extends StatelessWidget {
  final Map basket;
  final List<String> images;
  ShppingForm({@required this.basket, @required this.images});

  @override
  Widget build(BuildContext context) {
    final userid = Provider.of<Users>(context);
    return StreamBuilder<UserShppingDetail>(
        stream: UserDetailDataBaseService(useiId: userid.uid).userdetailStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return OderForm(
                userShppingDetail: snapshot.data,
                basket: this.basket,
                id: userid.uid,
                images: this.images,
              );
            } else if (!snapshot.hasData) {
              return OderForm(
                basket: this.basket,
                id: userid.uid,
                images: this.images,
              );
            }
          }
          return Loading();
        });
  }
}
