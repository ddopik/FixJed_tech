import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

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