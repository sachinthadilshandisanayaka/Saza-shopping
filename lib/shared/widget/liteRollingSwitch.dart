import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

Widget liteRollingSwith(
    {@required Function changeVisibility,
    @required String type,
    @required bool ismainItemAvalible}) {
  bool visibilityDefault;
  return new Container(
    height: 35.0,
    child: FittedBox(
      fit: BoxFit.contain,
      child: new LiteRollingSwitch(
        value: ismainItemAvalible,
        textOn: "active",
        textOff: "inactive",
        colorOn: Colors.greenAccent,
        colorOff: Colors.redAccent,
        iconOn: Icons.done,
        iconOff: Icons.remove_circle_outline,
        onChanged: (bool state) {
          visibilityDefault = state;
        },
        onTap: () {
          changeVisibility(visibilityDefault, type);
        },
        onSwipe: () {
          changeVisibility(visibilityDefault, type);
        },
        onDoubleTap: () {
          changeVisibility(visibilityDefault, type);
        },
      ),
    ),
  );
}
