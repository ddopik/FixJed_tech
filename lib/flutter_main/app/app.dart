import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/config.dart';
import 'package:flutter_base_app/flutter_main/common/styles.dart';
import 'package:flutter_base_app/flutter_main/screens/home/model/FixJidCategory.dart';
import 'package:flutter_base_app/flutter_main/screens/login/login_screens.dart';
import 'package:flutter_base_app/flutter_main/screens/service/main/service_features_screen.dart';
import 'package:flutter_base_app/flutter_main/storage/local_preferences.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'app_model.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  ////todo add you project providers here
  final _app = AppModel();

  /// Build the App Theme
  ThemeData getTheme(context) {
    Logger(printer: SimplePrinter(colors: true)).v("[AppState] build Theme");

    AppModel appModel = Provider.of<AppModel>(context, listen: false);
    bool isDarkTheme = appModel.darkTheme ?? false;

    if (isDarkTheme) {
      return buildDarkTheme(appModel.locale).copyWith(
        primaryColor: Color(int.parse(AppDefaultConfig['app_main_color'])),
      );
    }

    //
    return buildLightTheme(appModel.locale).copyWith(
        primaryColor: Colors.blueAccent, scaffoldBackgroundColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LocalPreferences().setUpLocalPreferences(),
        builder: (context, snapshot) {
          return ChangeNotifierProvider<AppModel>.value(
            value: _app,
            child: Consumer<AppModel>(
              builder: (context, value, child) {
                return MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (_) => _app),
                  ],
                  child: MaterialApp(
                    ///todo include MaterialApp to new <consumer> decedent of AppLanguageModel
                    debugShowCheckedModeBanner: false,
                    locale: Locale(Provider.of<AppModel>(context).locale, ""),
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    home: Scaffold(
                      body: getNextScreen(),
                    ),
                    routes: Routes.getAll(),
                    theme: getTheme(context),
                  ),
                );
              },
            ),
          );
        });
  }

  Widget getNextScreen() {
    var cat = FixJidCategory(
        imgPath: "assets/images/ic_menu_8.png", name: "title", desc: "desc desc desc desc desc");
    return ServiceFeatures(cat);

    if (LocalPreferences().checkLogin()) {
      return Container(); // todo navigate to home Screen
    } else if (LocalPreferences().isAppFirstSeen()) {
      LocalPreferences().setFirstSeen(false);
      return LoginScreen(); // todo navigate to on Boarding screen
    } else {
      return Container(); // todo navigate to on Login screen
    }
  }
}
