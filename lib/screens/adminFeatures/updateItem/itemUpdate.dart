import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/shared/constant.dart';

class ItemUpdate extends StatefulWidget {
  final MainItems mainItems;
  ItemUpdate({this.mainItems});

  @override
  _ItemUpdateState createState() => _ItemUpdateState();
}

class _ItemUpdateState extends State<ItemUpdate> {
  final _formKey = GlobalKey<FormState>();
  MainItems changeMiainItems;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: widget.mainItems.name,
                  decoration:
                      textinputDecoration.copyWith(labelText: 'Item name'),
                  onChanged: (val) {
                    setState(() {
                      changeMiainItems.name = val.trim();
                    });
                  },
                  validator: (val) {
                    if (val.trim().isEmpty) {
                      return "can't be null";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.mainItems.price,
                  keyboardType: TextInputType.number,
                  decoration: textinputDecoration.copyWith(labelText: 'Price'),
                  onChanged: (val) {
                    setState(() {
                      changeMiainItems.price = val.trim();
                    });
                  },
                  validator: (val) {
                    if (val.trim().isEmpty) {
                      return "can't be null";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.mainItems.price,
                  keyboardType: TextInputType.number,
                  decoration: textinputDecoration.copyWith(labelText: 'Price'),
                  onChanged: (val) {
                    setState(() {
                      changeMiainItems.price = val.trim();
                    });
                  },
                  validator: (val) {
                    if (val.trim().isEmpty) {
                      return "can't be null";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.mainItems.offer.toString() ?? null,
                  keyboardType: TextInputType.number,
                  decoration: textinputDecoration.copyWith(
                      labelText: 'Offer',
                      hintText: 'add offer precentage \'%\''),
                  onChanged: (val) {
                    setState(() {
                      changeMiainItems.offer = double.parse(val.trim());
                    });
                  },
                  validator: (val) {
                    if (val.trim().isEmpty) {
                      return "can't be null";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.mainItems.material ?? '',
                  decoration: textinputDecoration.copyWith(
                    labelText: 'Material',
                  ),
                  onChanged: (val) {
                    setState(() {
                      changeMiainItems.offer = double.parse(val.trim());
                    });
                  },
                  validator: (val) {
                    if (val.trim().isEmpty) {
                      return "can't be null";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
