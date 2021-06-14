import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sazashopping/models/user.dart';
import 'package:sazashopping/models/userShippingDetails.dart';
import 'package:sazashopping/screens/ordering/orderForm.dart';
import 'package:sazashopping/services/userDetailDatabase.dart';
import 'package:sazashopping/shared/loading.dart';

class ShppingForm extends StatelessWidget {
  final Map basket;
  ShppingForm({@required this.basket});

  @override
  Widget build(BuildContext context) {
    final userid = Provider.of<Users>(context);
    return StreamBuilder<UserShppingDetail>(
        stream: UserDetailDataBaseService(useiId: userid.uid).userdetailStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return OderForm(
                userShppingDetail: snapshot.data,
                basket: this.basket,
                id: userid.uid);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('error is occure'),
            );
          }
          return Loading();
        });
  }
}
