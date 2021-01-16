import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

Widget customActionButton({
  String btnText,
  Function onPressed,
  double width,
  double height,
  double fontSize,
  Color textColor,
  Color btnColor,
  bool enable = true,
}) {
  Color getButtonColorState() {
    if (enable) {
      return btnColor ?? btnColor;
    } else {
      return lightPrimary;
    }
  }

  return RaisedButton(
    onPressed: () {
      enable ? onPressed() : null;
    },
    textColor: textColor ?? Colors.white,
    color: getButtonColorState(),
    padding: EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(24.0),
    ),
    child: Container(
      width: width ?? 225,
      height: height ?? 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
      child: Text(
        btnText,
        style: TextStyle(fontSize: fontSize ?? 15),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
