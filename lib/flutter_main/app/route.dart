import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/screens/home_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/login_screens.dart';
import 'package:flutter_base_app/flutter_main/screens/on_boarding.dart';
import 'package:flutter_base_app/flutter_main/screens/signup_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;

  static final ONBOARDING = "/OnBoardingScreen";
  static final SIGNUP = "/SignUpScreen";
  static final LOGIN = "/loginScreen";
  static final HOME = "/homeScreen";

  static final Map<String, WidgetBuilder> _routes = {
    HOME: (context) => HomeScreen(),
    SIGNUP: (context) => SignUpScreen(),
    LOGIN: (context) => LoginScreen(),
    ONBOARDING: (context) => OnBoardingScreen(),
  };

// todo add this attribute to main Appwidget  ---> onGenerateRoute: Routes.getRouteGenerate, of Main app widget
  // static Route getRouteGenerate(RouteSettings settings) =>
  //     _routeGenerate(settings);
  // // handle unNamed route here , or make some initialization for a specific route
  // static Route _routeGenerate(RouteSettings settings) {
  //
  //   switch (settings.name) {
  //     case RouteList.homeSearch:
  //       return _buildRouteFade(settings, HomeSearchPage());
  //
  //       break;
  //     default:
  //       return _errorRoute();
  //   }
  // }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Page not found'),
        ),
      );
    });
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }

  static PageRouteBuilder _buildRouteFade(
      RouteSettings settings, Widget builder) {
    return _FadedTransitionRoute(
      settings: settings,
      widget: builder,
    );
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  final RouteSettings settings;

  _FadedTransitionRoute({this.widget, this.settings})
      : super(
            settings: settings,
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(milliseconds: 100),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ),
                child: child,
              );
            });
}
