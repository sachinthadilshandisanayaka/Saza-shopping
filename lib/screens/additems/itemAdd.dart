import 'package:flutter/material.dart';
import 'package:sazashopping/services/categoryCollection.dart';
import 'package:sazashopping/shared/colors.dart';
import 'package:sazashopping/shared/constant.dart';

class ItemAdding extends StatefulWidget {
  @override
  _ItemAddingState createState() => _ItemAddingState();
}

class _ItemAddingState extends State<ItemAdding> {
  final _formKeyAddItem = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroudColor,
        appBar: AppBar(
          actions: [],
        ),
        body: StreamBuilder<Object>(
            stream: CategoryDataBaseService().catogories,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
              } else {
                print('---------------- no data ------------------');
              }

              return Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKeyAddItem,
                      child: Column(
                        children: [
                          Text('Item name'),
                          TextFormField(
                            decoration: textinputDecoration,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
