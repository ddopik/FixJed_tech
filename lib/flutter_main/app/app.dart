import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/screens/home/home_screen.dart';
import 'package:flutter_base_app/flutter_main/storage/pref_manager.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'app_model.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  final _app = AppModel();

  @override
  void initState() {
    super.initState();
  }

  /// Build the App Theme
  ThemeData getTheme() {
    return ThemeData.light().copyWith(
        brightness: Brightness.dark,
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
            color: Color(0xff000000),
            fontSize: 14,
            fontWeight: FontWeight.w400,
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
        ));
  }

  @override
  Widget build(BuildContext appContext) {
    // print("Current App Local ---> "+Provider.of<AppModel>(context,listen: false).local.languageCode.toString() );
    return FutureBuilder(
        future: PrefManager().setupSharedPreferences(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            hideLoading();
            return ChangeNotifierProvider<AppModel>.value(
              value: _app,
              child: Consumer<AppModel>(
                builder: (context, value, child) {
                  return MultiProvider(
                    providers: [
                      // Provider<AppModel>.value(value: widget._app),
                      ChangeNotifierProvider.value(value: _app),
                    ],
                    child: MaterialApp(
                      navigatorKey: navigatorKey,

                      ///todo include MaterialApp to new <consumer> decedent of AppLanguageModel
                      debugShowCheckedModeBanner: false,
                      supportedLocales: S.delegate.supportedLocales,
                      locale: Provider.of<AppModel>(context).local,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        DefaultCupertinoLocalizations.delegate,
                      ],
                      builder: EasyLoading.init(),
                      theme: getTheme(),
                      home: getNextScreen(),
                      routes: Routes.getAll(),
                    ),
                  );
                },
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              color: Color(0xffffffff),
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  getNextScreen() {
    return HomeScreen();
    if (PrefManager().getUserToken() != null) {
      return HomeScreen();
    } else {}
  }
}
