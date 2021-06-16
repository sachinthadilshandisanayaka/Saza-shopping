import 'package:flutter/material.dart';
import 'package:sazashopping/shared/constant.dart';

class SelectionDropDown extends StatefulWidget {
  final List<String> items;
  final String name;
  final Function function;
  final String selecteSize;
  SelectionDropDown({
    @required this.items,
    @required this.name,
    @required this.function,
    this.selecteSize,
  });

  @override
  _SelectionDropDownState createState() => _SelectionDropDownState();
}

class _SelectionDropDownState extends State<SelectionDropDown> {
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
                  elevation: 8,
                  value: widget.selecteSize,
                  hint: Text(
                    'choose one',
                    style: itemdefaultStyle,
                  ),
                  isExpanded: true,
                  onChanged: (value) => widget.function(value),
                  onSaved: (value) => widget.function(value),
                  items: widget.items.map((String getsize) {
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
