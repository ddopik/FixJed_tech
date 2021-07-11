import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

Widget customActionButton(
    {Text btnText,
    Function onPressed,
    double width,
    double height,
    double fontSize,
    Color btnColor,
    bool enable = true,
    btnRadius = 24.0}) {
  Color getButtonColorState() {
    if (enable) {
      return btnColor ?? btnColor;
    } else {
      return lightPrimary;
    }
  }

  return MaterialButton(
    onPressed: () {
      enable ? onPressed() : () {};
    },
    color: getButtonColorState(),
    padding: EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(btnRadius),
    ),
    child: Container(
      width: width ?? 225,
      height: height ?? 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: Alignment.center,
      child: btnText,
    ),
  );
}
