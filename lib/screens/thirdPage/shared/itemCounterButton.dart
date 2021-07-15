import 'package:flutter/material.dart';
import 'package:sazashopping/shared/colors.dart';

class CounterButton extends StatefulWidget {
  final int size;
  final int count;
  final Function incress;
  final Function descrise;
  const CounterButton(
      {@required this.size, this.incress, this.descrise, this.count});

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: appBarColor,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          widget.count != 0
              ? InkWell(
                  onTap: () => widget.descrise(),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              : SizedBox(),
          SizedBox(
            width: 3,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.white,
            ),
            child: Text(
              widget.count.toString(),
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          SizedBox(
            width: 3,
          ),
          widget.size != widget.count
              ? InkWell(
                  onTap: () => widget.incress(),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
