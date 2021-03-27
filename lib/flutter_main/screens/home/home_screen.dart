import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/main_category_list_view.dart';
import 'package:flutter_base_app/flutter_main/screens/notification/notification_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/profile/profile_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/transaction/transaction_screen.dart';
import 'package:flutter_base_app/generated/l10n.dart';

import 'home_navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  CurrentHomeSelection _currentDrawerSelection;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        _currentDrawerSelection =
            ModalRoute.of(context).settings.arguments as CurrentHomeSelection;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: getTitle(),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                child: Image(
                    image: AssetImage("assets/images/ic_shopping.png"),
                    width: 40,
                    height: 40,
                    fit: BoxFit.scaleDown),
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.CART);
                },
              ),
            )
          ],
        ),
        drawer: HomeNavigationDrawer(
          onNavigateClick: (selectedNav) {
            setState(() {
              _currentDrawerSelection = selectedNav;
            });
          },
        ),
        body: Container(
          color: Colors.white,
          child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: outer_boundary_field_space),
              decoration: BoxDecoration(
                  color: Color(0xFFF5F4F4),
                  image: DecorationImage(
                      image: AssetImage("assets/images/background_2.png"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0))),
              alignment: Alignment.center,
              child: renderMainView()),
        ));
  }

  Widget renderMainView() {
    print("renderMainView ----> " + _currentDrawerSelection.toString());
    switch (_currentDrawerSelection) {
      case CurrentHomeSelection.HOME:
        return MainCategoryListView();
      case CurrentHomeSelection.TRANSACTION:
        return TransactionScreen();

        break;
      case CurrentHomeSelection.NOTIFICATION:
        return NotificationScreen();
        break;
      case CurrentHomeSelection.PROFILE:
        return ProfileScreen();
        break;
      default:
        {
          return MainCategoryListView();
        }
    }
  }

  Widget getTitle() {
    switch (_currentDrawerSelection) {
      case CurrentHomeSelection.HOME:
        return Container(
            alignment: Alignment.bottomCenter,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      style: TextStyle(
                          color: boring_green,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Raleway",
                          fontStyle: FontStyle.normal,
                          fontSize: text_size_1),
                      text: S.current.deliveringTo),
                  TextSpan(text: " \n "),
                  TextSpan(
                    style: const TextStyle(
                        color: french_blue,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Raleway",
                        fontStyle: FontStyle.normal,
                        fontSize: text_size_1),
                    text: S.current.fixedAddressOne,
                  )
                ])));
      case CurrentHomeSelection.TRANSACTION:
        return titleView(S.current.myServices);
        break;
      case CurrentHomeSelection.NOTIFICATION:
        return titleView(S.current.notification);
        break;
      case CurrentHomeSelection.PROFILE:
        return titleView(S.current.profile);
        break;
      default:
        {
          return Container(
              alignment: Alignment.bottomCenter,
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        style: TextStyle(
                            color: boring_green,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                            fontSize: text_size_1),
                        text: S.current.deliveringTo),
                    TextSpan(text: " \n "),
                    TextSpan(
                      style: const TextStyle(
                          color: french_blue,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Raleway",
                          fontStyle: FontStyle.normal,
                          fontSize: text_size_1),
                      text: S.current.fixedAddressOne,
                    )
                  ])));
        }
    }
  }

  titleView(txt) {
    return new Text(txt,
        style: TextStyle(
          fontFamily: 'Tajawal',
          color: Color(0xd9275597),
          fontSize: 22,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ));
  }
}
