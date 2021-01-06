import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/app_model.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/main_category_list_view.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: new Scaffold(
            appBar: AppBar(
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
            drawer: navigationDrawer(),
            body: Container(
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
            )));
  }
}

class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          Container(
            margin: EdgeInsets.all(14.0),
            child: Text(
              S.of(context).myServices,
              style:
                  TextStyle(color: boring_green, fontWeight: FontWeight.w600),
            ),
            alignment: Alignment.center,
          ),
          Divider(),
          Container(
            margin: EdgeInsets.all(14.0),
            child: Text(S.of(context).notification,
                style: TextStyle(
                    color: boring_green, fontWeight: FontWeight.w600)),
            alignment: Alignment.center,
          ),
          Divider(),
          Container(
            margin: EdgeInsets.all(14.0),
            child: Text(S.of(context).setting,
                style: TextStyle(
                    color: boring_green, fontWeight: FontWeight.w600)),
            alignment: Alignment.center,
          ),
          Divider(),
          Container(
            margin: EdgeInsets.all(14.0),
            child: Text(S.of(context).help,
                style: TextStyle(
                    color: boring_green, fontWeight: FontWeight.w600)),
            alignment: Alignment.center,
          ),
          Divider(),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(14.0),
              child: Text(
                  Provider.of<AppModel>(context).isUserLoggedIn()
                      ? S.of(context).signOut
                      : S.of(context).login,
                  style: TextStyle(
                      color: boring_green, fontWeight: FontWeight.w600)),
              alignment: Alignment.center,
            ),
            onTap: () {
              if (Provider.of<AppModel>(context,listen: false).isUserLoggedIn()) {
                Provider.of<AppModel>(context,listen: false).logOutUser();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.LOGIN, (route) => false);
              } else {
                Navigator.of(context).pushNamed(Routes.LOGIN);
              }
            },
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                width: 110,
                  height: 110,
                  image: AssetImage("assets/images/img_profile.jpeg"),
                  fit: BoxFit.contain),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile picture
                  Flexible(
                    child: Container(
                      child: Text(
                        "Mohamed Ahmed",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                          fontFamily: "Tajawal",
                        ),
                      ),
                    ),
                  ),
                  // Rectangle 85
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: 150,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                              spreadRadius: 0)
                        ],
                        color: boring_green),
                    child: Text(
                      S.of(navigatorKey.currentContext).edit_profile,
                      style: TextStyle(
                        color: const Color(0xffffffff),
                        fontFamily: "Raleway",
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 8.0,
              ),
            ]));
  }

  Widget createDrawerBodyItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
