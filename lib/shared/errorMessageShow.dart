import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ErrorMessages extends StatefulWidget {
  final String message;
  ErrorMessages({@required this.message});

  @override
  _ErrorMessagesState createState() => _ErrorMessagesState();
}

class _ErrorMessagesState extends State<ErrorMessages>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _offsetAnimation;
  String data;

  @override
  void initState() {
    super.initState();
    data = widget.message;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.1, 0.0),
    ).animate(
      CurvedAnimation(
        curve: Curves.bounceIn,
        parent: _animationController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? SizedBox(
            height: 0,
          )
        : SlideTransition(
            position: _offsetAnimation,
            child: Container(
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
            ),
          );
  }
}
