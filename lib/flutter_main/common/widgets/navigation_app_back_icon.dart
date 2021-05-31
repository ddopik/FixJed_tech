import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/app_model.dart';
import 'package:provider/provider.dart';

IconData getBackNavigationIcon(BuildContext context) {
  return Icons.arrow_back_ios;
  if (Provider.of<AppModel>(context).local.languageCode != "ar") {
    return Icons.arrow_back_ios;
  } else {
    return Icons.arrow_forward_ios;
  }
}
