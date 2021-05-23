import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

Widget liteRollingSwith({@required Function changeVisibility}) {
  bool genderVisibilityDefault;
  return new Container(
    height: 35.0,
    child: FittedBox(
      fit: BoxFit.contain,
      child: new LiteRollingSwitch(
        value: false,
        textOn: "active",
        textOff: "inactive",
        colorOn: Colors.greenAccent,
        colorOff: Colors.redAccent,
        iconOn: Icons.done,
        iconOff: Icons.remove_circle_outline,
        onChanged: (bool state) {
          genderVisibilityDefault = state;
        },
        onTap: () {
          changeVisibility(genderVisibilityDefault, "gender");
        },
        onSwipe: () {
          changeVisibility(genderVisibilityDefault, "gender");
        },
        onDoubleTap: () {
          changeVisibility(genderVisibilityDefault, "gender");
        },
      ),
    ),
  );
}
