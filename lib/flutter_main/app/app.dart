import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/styles.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/savedAddress/address_list_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/home/home_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/login/login_screens.dart';
import 'package:flutter_base_app/flutter_main/screens/signup/signup_screen.dart';
import 'package:flutter_base_app/flutter_main/storage/pref_manager.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  final _app = AppModel();

  @override
  void initState() {
    super.initState();
  }

  /// Build the App Theme
  ThemeData getTheme(currentLocal, AppModel appModel) {
    Logger(printer: SimplePrinter(colors: true)).v("[AppState] build Theme");

    bool isDarkTheme = appModel.darkTheme ?? false;

    if (isDarkTheme) {
      return buildDarkTheme(currentLocal).copyWith(
        primaryColor: Color(int.parse("4282476961")),
      );
    }

    //
    return buildLightTheme(currentLocal).copyWith(
      appBarTheme: AppBarTheme(
          textTheme: TextTheme(
              headline6: TextStyle(
                  color: const Color(0xd9275597),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Tajawal",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0)),
          iconTheme: IconThemeData(color: french_blue)),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext appContext) {
    return FutureBuilder(
        future: PrefManager().setupSharedPreferences(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            dismissLoading();
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
                      locale: Provider.of<AppModel>(context).locale,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        DefaultCupertinoLocalizations.delegate,
                      ],
                      builder: EasyLoading.init(),
                      theme: getTheme("ar", value),
                      home: Directionality(
                        child: Scaffold(
                          body: getNextScreen(),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
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
    } else {
      return SignUpScreen();
    }
  }
}
