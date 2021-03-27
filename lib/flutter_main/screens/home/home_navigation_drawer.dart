import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/app_model.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class HomeNavigationDrawer extends StatefulWidget {
  final Function onNavigateClick;

  HomeNavigationDrawer({this.onNavigateClick});

  @override
  State<StatefulWidget> createState() {
    return _HomeNavigationDrawer();
  }
}

class _HomeNavigationDrawer extends State<HomeNavigationDrawer> {
  CurrentHomeSelection _currentHomeSelection;

  @override
  void initState() {
    _currentHomeSelection = CurrentHomeSelection.HOME;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          createDrawerHeader(),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Color(0xfff5f4f4),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(28.0),
                    topLeft: Radius.circular(28.0))),
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 14.0, bottom: 14.0, left: 34, right: 34),
                    alignment: Alignment.centerRight,
                    child: Text(
                      S.of(context).main,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          color: boring_green,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  onTap: () {
                    widget.onNavigateClick(CurrentHomeSelection.HOME);
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 14.0, bottom: 14.0, left: 34, right: 34),
                    alignment: Alignment.centerRight,
                    child: Text(
                        S.of(context).myServices,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          color: boring_green,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  onTap: () {
                    widget.onNavigateClick(CurrentHomeSelection.TRANSACTION);
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 14.0, bottom: 14.0, left: 34, right: 34),
                        alignment: Alignment.centerRight,
                        child: Text(
                            S.of(context).notification,
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              color: boring_green,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                      // Ellipse 16
                      Row(
                        children: [
                          Container(
                              width: 24,
                              height: 24,
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(24)),
                              child: Center(
                                child: // 2
                                    new Text("2",
                                        style: TextStyle(
                                          fontFamily: 'Futura',
                                          color: Color(0xffffffff),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                        )),
                              )),
                          SizedBox(
                            width: 24,
                          )
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    widget.onNavigateClick(CurrentHomeSelection.NOTIFICATION);
                    Navigator.pop(context);
                  },
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(
                      top: 14.0, bottom: 14.0, left: 34, right: 34),
                  alignment: Alignment.centerRight,
                  child: Text(S.of(context).setting,
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        color: boring_green,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(
                      top: 14.0, bottom: 14.0, left: 34, right: 34),
                  alignment: Alignment.centerRight,
                  child: Text(
                      S.of(context).help,
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        color: boring_green,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Divider(),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 14.0, bottom: 14.0, left: 34, right: 34),
                    alignment: Alignment.centerRight,
                    child: Text(
                        Provider.of<AppModel>(context).isUserLoggedIn()
                            ? S.of(context).signOut
                            : S.of(context).login,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          color: boring_green,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  onTap: () {
                    if (Provider.of<AppModel>(context, listen: false)
                        .isUserLoggedIn()) {
                      Provider.of<AppModel>(context, listen: false)
                          .logOutUser();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.HOME, (route) => false);
                    } else {
                      Navigator.pushNamed(context, Routes.LOGIN);
                    }
                  },
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.white,
        )),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              (Provider.of<AppModel>(context).getUserProfileImage() != '' &&
                      Provider.of<AppModel>(context).getUserProfileImage() !=
                          'null')
                  ? CustomImageLoader.image(
                      url: Provider.of<AppModel>(context).getUserProfileImage(),
                      width: 110,
                      height: 110,
                      fit: BoxFit.contain)
                  : Image(
                      width: 110,
                      height: 110,
                      image: AssetImage("assets/images/img_profile.jpeg"),
                      fit: BoxFit.contain),
              (Provider.of<AppModel>(context).getUserName().isNotEmpty)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            child: Text(
                              Provider.of<AppModel>(context).getUserName(),
                              style: TextStyle(
                                fontSize: 16,
                                color: const Color(0xff403e3e),
                                fontWeight: FontWeight.w700,
                                fontFamily: "Tajawal",
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                        // Rectangle 85
                        SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 150,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
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
                                fontFamily: 'Tajawal',
                                color: Color(0xffffffff),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onTap: () {
                            widget
                                .onNavigateClick(CurrentHomeSelection.PROFILE);
                            Navigator.pop(context);
                          },
                        )
                      ],
                    )
                  : Container(),
              SizedBox(
                width: 8.0,
              ),
            ]));
  }
}

enum CurrentHomeSelection { HOME, TRANSACTION, NOTIFICATION, PROFILE }
