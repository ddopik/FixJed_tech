import 'package:flutter/material.dart';

import '../colors.dart';

/// Build the App Theme
ThemeData getTheme() {
  return ThemeData.light().copyWith(
      primaryColor: french_blue,
      accentColor: Color(0xff27ae60),
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            color: Color(0xffffffff),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
          iconTheme: IconThemeData(color: Colors.white)),
      scaffoldBackgroundColor: french_blue,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontFamily: 'Montserrat',
          color: Color(0xffffffff),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyText2: TextStyle(
          fontFamily: 'Montserrat',
          color: Color(0xffffffff),
          fontSize: 12,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
        ),
        headline3: TextStyle(
          fontFamily: 'Montserrat',
          color: Color(0xffffffff),
          fontSize: 12,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
        headline4: TextStyle(
          fontFamily: 'Montserrat',
          color: Color(0xffffffff),
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
        headline5: TextStyle(
          fontFamily: 'Montserrat',
          color: Color(0xffffffff),
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
        headline6: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      ),
      // / reflect on Any inputForm Field
      inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          errorStyle: TextStyle(height: 0),
          hintStyle: TextStyle(
            fontFamily: 'Raleway',
            color: Color(0xFF61BA66),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          )));
}
