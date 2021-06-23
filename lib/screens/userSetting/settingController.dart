import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sazashopping/screens/userSetting/options/userDetail.dart';
import 'package:sazashopping/screens/userSetting/shared/shared.dart';
import 'package:sazashopping/shared/colors.dart';

class SettingOptionDisplay extends StatelessWidget {
  final String userId;
  SettingOptionDisplay({@required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: appBarColor,
        actions: [],
      ),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(15),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: SettingConstant.settingOptions.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () async {
                if (SettingConstant.userdetail ==
                    SettingConstant.settingOptions[index]) {
                  dynamic result = await Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => UserDetails(
                        uid: userId,
                      ),
                    ),
                  );
                  if (result == 'success') {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: Text('Updated'),
                        content: Text('update success'),
                        insetAnimationCurve: Curves.elasticIn,
                        actions: <Widget>[
                          CupertinoDialogAction(
                            isDefaultAction: false,
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
              title: Text(
                SettingConstant.settingOptions[index],
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  wordSpacing: 1,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
