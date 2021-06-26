import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

clearFocus(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus.unfocus();
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

var logger = Logger(
  printer: PrettyPrinter(),
);

String get currentLanguage {
  return isRTL ? "AR" : "EN";
}

bool get isRTL {
  return Localizations.localeOf(navigatorKey.currentContext).toString() == "ar";
}

bool isEmail(String em) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(em);
  return emailValid;
}

bool isNumber(String string) {
  // Null or empty string is not a number
  if (string == null || string.isEmpty) {
    return false;
  }

  // Try to parse input string to number.
  // Both integer and double work.
  // Use int.tryParse if you want to check integer only.
  // Use double.tryParse if you want to check double only.
  final number = num.tryParse(string);

  if (number == null) {
    return false;
  }

  return true;
}

/// trims leading whitespace
String ltrim(String str) {
  return str.replaceFirst(new RegExp(r"^\s+"), "");
}

/// trims trailing whitespace
String rtrim(String str) {
  return str.replaceFirst(new RegExp(r"\s+$"), "");
}

String trimAll(String str) {
  String value = ltrim(str);
  value = rtrim(value);
  return value;
}

String parseTimeToMonthDate(String timeVal) {
  String datetime = timeVal;
  DateTime now = DateTime.parse(datetime);
  return DateFormat("dd/MM/yyyy").format(now);
}

String parseTimeToHour(String timeVal) {
  String datetime = timeVal;
  DateTime now = DateTime.parse(datetime);
  return DateFormat("HH:MM").format(now);
}
