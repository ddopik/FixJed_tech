import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/main_category_list_view.dart';
import 'package:flutter_base_app/flutter_main/screens/transaction/transaction_screen.dart';

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
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: new Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              title: Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.800000011920929,
                      child: Text("Delivering to",
                          style: const TextStyle(
                            color: boring_green,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.left),
                    ),
                    Text("5th settlements",
                        style: const TextStyle(
                          color: french_blue,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Raleway",
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.left)
                  ],
                ),
              ),
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
            body: renderMainView()));
  }

  Widget renderMainView() {
    switch (_currentDrawerSelection) {
      case CurrentHomeSelection.HOME:
        {
          return getMainCategoryView();
        }
      case CurrentHomeSelection.TRANSACTION:
        return TransactionScreen();
        break;
      default:
        {
          return TransactionScreen();
        }
    }
  }

  Widget getMainCategoryView() {
    return Container(
      color: Colors.white,
      child: Container(
          margin: EdgeInsets.only(top: 2.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background_2.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0))),
          alignment: Alignment.center,
          child: MainCategoryListView()),
    );
  }
}
