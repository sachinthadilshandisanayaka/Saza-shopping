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
                  await Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => UserDetails(
                        uid: userId,
                      ),
                    ),
                  );
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
