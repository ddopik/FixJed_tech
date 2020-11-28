import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:common_library/utils/screen_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/screens/login_screens.dart';
import 'package:flutter_base_app/flutter_main/storage/storage_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_model.dart';

class AppInit extends StatefulWidget {

  @override
  _AppInitState createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> with AfterLayoutMixin {

  @override
  void initState() {
    super.initState();
    // Provider.of<StorageModel>(context,listen: false).isAppFirstTimeSeen();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return getNextScreen();

  }

  Widget getNextScreen() {

    if (Provider.of<StorageModel>(context, listen: false).userLoggedIn) {
      return Container(); // todo navigate to home Screen
    } else if (Provider.of<StorageModel>(context, listen: false).appIsFirstSeen) {
      Provider.of<StorageModel>(context, listen: false).setIsAppFirstTimeOpen(false);
      return LoginScreen(); // todo navigate to on Boarding screen
    } else {
      return Container(); // todo navigate to on Login screen
    }
  }

  @override
  void afterFirstLayout(BuildContext context) {
    /// // a handful class to get device dimension and use it later with your app
    /// not that this class is static  and you can reference it with it's name */
    /// and it is mainly used for Ui test ....
    ScreenUtil.init(context);
  }
}
