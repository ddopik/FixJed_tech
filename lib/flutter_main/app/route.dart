import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/screens/cart/cart_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/address_form_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/savedAddress/address_list_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/payment/payment_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/home/home_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/login/login_screens.dart';
import 'package:flutter_base_app/flutter_main/screens/onboarding/on_boarding.dart';
 import 'package:flutter_base_app/flutter_main/screens/service/main/service_features_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/service/sub/sub_service_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/signup/SignUpSuccessScreen.dart';
import 'package:flutter_base_app/flutter_main/screens/signup/signup_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;

  static const ON_BOARDING = "/OnBoardingScreen";
  static const SIGN_UP = "/SignUpScreen";
  static const SIGN_UP_SUCCESS = "/sign_up_success";
  static const LOGIN = "/loginScreen";
  static const FORGOT_PASSWORD = "/forgot_password";
  static const HOME = "/homeScreen";
  static const SERVICE_FEATURES = "/service_features";
  static const SUB_SERVICE_FEATURES = "/sub_service_features";
  static const CART = "/cart";
  static const ADDRESS_FORM_SCREEN = "/address_form_screen";
  static const ADDRESS_LIST_SCREEN = "/address_list_screen";
  static const PAYMENT_SCREEN = "/payment_screen";

  static final Map<String, WidgetBuilder> _routes = {
    HOME: (context) => HomeScreen(),
    SIGN_UP: (context) => SignUpScreen(),
    SIGN_UP_SUCCESS: (context) => SignUpSuccessScreen(),
    FORGOT_PASSWORD: (context) => ForgotPasswordScreen(),
    LOGIN: (context) => LoginScreen(),
    ON_BOARDING: (context) => OnBoardingScreen(),
    SERVICE_FEATURES: (context) => ServiceFeaturesScreen(),
    SUB_SERVICE_FEATURES: (context) => SubServicesFeaturesScreen(),
    CART: (context) => CartScreen(),
    ADDRESS_FORM_SCREEN: (context) => AddressFormScreen(),
    ADDRESS_LIST_SCREEN: (context) => AddressListScreen(),
    PAYMENT_SCREEN: (context) => PaymentScreen(),
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
