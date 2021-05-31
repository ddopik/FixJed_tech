import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'flutter_main/app/app.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(App());
}
