import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/screens/cancel_request/cancel_request_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/home/counter_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/home/home_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/login/login_screens.dart';
import 'package:flutter_base_app/flutter_main/screens/notification/notification_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/order_submit_screen/order_submit_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/order_submission_feedback/order_submission_feedback_Screen.dart';
import 'package:flutter_base_app/flutter_main/screens/profile/profile_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/view/RequestsListScreen.dart';

//import 'package:flutter_base_app/flutter_main/screens/request_screen/request_card_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/request_screen/transaction_card_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;

  static const LOGIN = "/loginScreen";
  static const HOME = "/home_screen";
  static const ALL_REQUESTS = "/all_requests";
  static const REQUEST_CARD = "/request_card";
  static const COUNTER_SCREEN = "/counter_screen";
  static const SERVICE_FEATURES = "/service_features";
  static const SUB_SERVICE_FEATURES = "/sub_service_features";
  static const CART = "/cart";

  static const PROFILE_SCREEN = "/profile_screen";
  static const ORDER_SUBMISSION_FEEDBACK = "/order_submission_feedback";
  static const NOTIFICATION_SCREEN = "/notification_screen";
  static const TRANSACTION_SUBMIT_SCREEN = "/transaction_submit_screen";
  static const CANCEL_TRANSACTION_REASONS_SCREEN =
      "/cancel_transaction_reason_screen";

  static final Map<String, WidgetBuilder> _routes = {
    HOME: (context) => HomeScreen(),
    LOGIN: (context) => LoginScreen(),
    PROFILE_SCREEN: (context) => ProfileScreen(),
    ALL_REQUESTS: (context) => RequestsListScreen(),
    REQUEST_CARD: (context) => TransactionCardScreen(
        arguments: ModalRoute.of(context).settings.arguments),
    COUNTER_SCREEN: (context) =>
        CounterScreen(arguments: ModalRoute.of(context).settings.arguments),
    NOTIFICATION_SCREEN: (context) => NotificationScreen(),
    TRANSACTION_SUBMIT_SCREEN: (context) => TransactionSubmitScreen(
        arguments: ModalRoute.of(context).settings.arguments),
    CANCEL_TRANSACTION_REASONS_SCREEN: (context) => CancelRequestScreen(
        arguments: ModalRoute.of(context).settings.arguments),
    ORDER_SUBMISSION_FEEDBACK: (context) => OrderSubmissionFeedback(),
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
