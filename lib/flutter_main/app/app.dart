import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/styles.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/screens/home/home_screen.dart';
 import 'package:flutter_base_app/flutter_main/screens/login/login_screens.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/service.dart';
import 'package:flutter_base_app/flutter_main/storage/local_preferences.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'app_model.dart';

class App extends StatefulWidget {
  final _app = AppModel();

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  ////todo add you project providers here

  @override
  void initState() {
    super.initState();
  }

  /// Build the App Theme
  ThemeData getTheme(context) {
    Logger(printer: SimplePrinter(colors: true)).v("[AppState] build Theme");

    AppModel appModel = Provider.of<AppModel>(context, listen: false);
    bool isDarkTheme = appModel.darkTheme ?? false;

    if (isDarkTheme) {
      return buildDarkTheme(appModel.locale).copyWith(
        primaryColor: Color(int.parse("4282476961")),
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
          if (snapshot.connectionState == ConnectionState.done) {
            dismissLoading();
            return ChangeNotifierProvider<AppModel>.value(
              value: widget._app,
              child: Consumer<AppModel>(
                builder: (context, value, child) {
                  return MultiProvider(
                    providers: [
                      ChangeNotifierProvider(create: (_) => widget._app),
                    ],
                    child: MaterialApp(
                      navigatorKey: navigatorKey,
                      ///todo include MaterialApp to new <consumer> decedent of AppLanguageModel
                      debugShowCheckedModeBanner: false,
                      supportedLocales: S.delegate.supportedLocales,
                      locale: Locale(Provider.of<AppModel>(context).locale, ""),
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        DefaultCupertinoLocalizations.delegate,
                      ],

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
          } else {
            print("FutureBuilder  snapshot.Not hasData --->" + snapshot.hasData.toString());
            return Center(child: CircularProgressIndicator(),);
          }
        });
  }

  Widget getNextScreen() {
    var cat = FixJidService(
        serviceImage: "assets/images/ic_menu_8.png",
        serviceName: "title",
        serviceDesc: "desc desc desc desc desc");

     // return HomeScreen();
    // return ServicesSubFeatures(cat);
    return HomeScreen();
    if (!LocalPreferences().isAppFirstSeen()) {

      if (!LocalPreferences().checkLogin()) {
        return HomeScreen();
      }else{
        return LoginScreen();
      }
    } else{
      LocalPreferences().setFirstSeen(false);
      return Container(); /// todo navigate to onBoarding screens
    }
  }
}
