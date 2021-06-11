import 'package:flutter/material.dart';
import 'package:sazashopping/models/mainItem.dart';
import 'package:sazashopping/screens/adminFeatures/additems/itemAddMainFrame.dart';
import 'package:sazashopping/screens/adminFeatures/shared/popupMenuTags.dart';

class AdminPopupMenu extends StatefulWidget {
  final MainItems mainItems;
  AdminPopupMenu({@required this.mainItems});

  @override
  _AdminPopupMenuState createState() => _AdminPopupMenuState();
}

class _AdminPopupMenuState extends State<AdminPopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(),
      onSelected: (action) {
        if (action == PopMenuTags.update) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemAddMainFrame(
                mainItems: widget.mainItems,
              ),
            ),
          );
        } else if (action == PopMenuTags.delete) {}
      },
      itemBuilder: (BuildContext context) {
        return PopMenuTags.menuTags.map((String tag) {
          return PopupMenuItem<String>(
            value: tag,
            child: Text(tag),
          );
        }).toList();
      },
    );
  }
}
