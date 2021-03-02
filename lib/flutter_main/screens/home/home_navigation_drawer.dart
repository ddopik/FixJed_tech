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
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(14.0),
              child: Text(
                S.of(context).main,
                style:
                    TextStyle(color: boring_green, fontWeight: FontWeight.w600),
              ),
              alignment: Alignment.center,
            ),
            onTap: () {
              widget.onNavigateClick(CurrentHomeSelection.HOME);
              Navigator.pop(context);
            },
          ),
          Divider(),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(14.0),
              child: Text(
                S.of(context).myServices,
                style:
                    TextStyle(color: boring_green, fontWeight: FontWeight.w600),
              ),
              alignment: Alignment.center,
            ),
            onTap: () {
              widget.onNavigateClick(CurrentHomeSelection.TRANSACTION);
              Navigator.pop(context);
            },
          ),
          Divider(),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(14.0),
              child: Text(S.of(context).notification,
                  style: TextStyle(
                      color: boring_green, fontWeight: FontWeight.w600)),
              alignment: Alignment.center,
            ),
            onTap: () {
              widget.onNavigateClick(CurrentHomeSelection.NOTIFICATION);
              Navigator.pop(context);
            },
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
              if (Provider.of<AppModel>(context, listen: false)
                  .isUserLoggedIn()) {
                Provider.of<AppModel>(context, listen: false).logOutUser();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.HOME, (route) => false);
              } else {
                Navigator.pushNamed(context, Routes.LOGIN);
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
                                color: const Color(0xffffffff),
                                fontFamily: "Raleway",
                                fontStyle: FontStyle.normal,
                              ),
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

enum CurrentHomeSelection { HOME, TRANSACTION, NOTIFICATION, PROFILE }
