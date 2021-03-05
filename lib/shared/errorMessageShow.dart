import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ErrorMessages extends StatefulWidget {
  final String message;
  ErrorMessages({@required this.message});

  @override
  _ErrorMessagesState createState() => _ErrorMessagesState();
}

class _ErrorMessagesState extends State<ErrorMessages> {
  String data;

  @override
  void initState() {
    super.initState();
    data = widget.message;
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? SizedBox(
            height: 0,
          )
        : Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.amber,
            child: Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.error_outline)),
                Expanded(
                  child: AutoSizeText(
                    data,
                    maxLines: 4,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      data = null;
                    });
                  },
                ),
              ],
            ),
          );
  }
}
