import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/config.dart';
import 'package:flutter_base_app/flutter_main/common/styles.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/storage/storage_model.dart';
import 'package:flutter_base_app/generated/l10n.dart';
 import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'app_init.dart';
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
  final _storageModel = StorageModel();


  /// Build the App Theme
  ThemeData getTheme(context) {
    Logger(printer: SimplePrinter(colors: true)).v("[AppState] build Theme");

    AppModel appModel = Provider.of<AppModel>(context,listen: false);
    bool isDarkTheme = appModel.darkTheme ?? false;


    if (isDarkTheme) {
      return buildDarkTheme(appModel.locale).copyWith(
        primaryColor: Color(int.parse(AppDefaultConfig['app_main_color'])),
      );
    }

    //
    return buildLightTheme(appModel.locale).copyWith(
      primaryColor: Colors.blueAccent,
    );
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<AppModel>.value(
      value: _app,
      child: Consumer<AppModel>(
        builder: (context, value, child) {
          return MultiProvider(
            providers: [
              Provider<StorageModel>.value(value: _storageModel),
              // ChangeNotifierProvider(create: (_) => cartModel.model),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: Locale(Provider
                  .of<AppModel>(context)
                  .locale, ""),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              home: Scaffold(
                body: AppInit(),
              ),
              routes: Routes.getAll(),
              theme: getTheme(context),
            ),
          );
        },
      ),
    );
  }
}
