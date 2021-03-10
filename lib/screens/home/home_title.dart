import 'package:flutter/material.dart';
import 'package:sazashopping/screens/home/searchBar/searchDelegate.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 20, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TextButton(
            child: Text(
              'search you wish...',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w200,
                fontFamily: 'Ballo2',
                fontSize: 12,
                letterSpacing: 2,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.0, 0.3),
                    blurRadius: 2.0,
                    color: Colors.black45,
                  )
                ],
              ),
            ),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search_rounded,
              color: Colors.black,
              size: 25,
            ),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
    );
  }
}
