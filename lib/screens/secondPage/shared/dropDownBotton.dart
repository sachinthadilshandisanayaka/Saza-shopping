import 'package:flutter/material.dart';
import 'package:sazashopping/shared/constant.dart';

class SelectionDropDown extends StatefulWidget {
  final List<Object> items;
  final String name;
  final Function function;
  SelectionDropDown(
      {@required this.items, @required this.name, @required this.function});

  @override
  _SelectionDropDownState createState() => _SelectionDropDownState();
}

class _SelectionDropDownState extends State<SelectionDropDown> {
  String selecteSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            widget.name,
            style: itemdefaultStyle,
          ),
        ),
        widget.items.length != 0
            ? Flexible(
                flex: 1,
                child: DropdownButtonFormField(
                  elevation: 0,
                  value: selecteSize,
                  hint: Text(
                    'choose one',
                    style: itemdefaultStyle,
                  ),
                  isExpanded: true,
                  onChanged: (value) => widget.function(value),
                  onSaved: (value) => widget.function(value),
                  validator: (Object value) {
                    if (value.toString().isEmpty) {
                      return "can't empty";
                    } else {
                      return null;
                    }
                  },
                  items: widget.items.map((Object getsize) {
                    return DropdownMenuItem(
                      value: getsize,
                      child: Text(
                        getsize,
                        style: inputFormTextStyle,
                      ),
                    );
                  }).toList(),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
