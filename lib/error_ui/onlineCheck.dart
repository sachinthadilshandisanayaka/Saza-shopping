import 'package:flutter/material.dart';

class ConnectionCheckAndShowInTop extends StatefulWidget {
  final bool connection;
  ConnectionCheckAndShowInTop({@required this.connection});
  @override
  _ConnectionCheckAndShowInTopState createState() =>
      _ConnectionCheckAndShowInTopState();
}

class _ConnectionCheckAndShowInTopState
    extends State<ConnectionCheckAndShowInTop> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.bounceIn,
      color: widget.connection ? null : Colors.red,
      child: widget.connection
          ? null
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'OFFLINE',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 8.0,
                ),
                SizedBox(
                  width: 12.0,
                  height: 12.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              ],
            ),
    );
  }
}
