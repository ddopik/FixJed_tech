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
      height: height ?? 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: Alignment.center,
      child: Text(
        btnText,
        style: TextStyle(
          fontFamily: 'Tajawal',
          color: Color(0xffffffff),
          fontSize: fontSize ?? 18,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
