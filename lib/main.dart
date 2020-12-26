import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'flutter_main/app/app.dart';
import 'flutter_main/common/colors.dart';
void main() {
  SharedPreferences.setMockInitialValues({});
  Provider.debugCheckInvalidValueType = null;
  runApp(App());
}



