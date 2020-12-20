import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/home/home_category_item.dart';

import 'model/FixJidCategory.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homePage';

  List<FixJidCategory> menuList = [
    FixJidCategory(
        id: "1",
        imgPath: "assets/images/ic_menu_8.png",
        name: 'Plumber',
        desc: "desc desc desc desc desc"),
    FixJidCategory(
        id: "2",
        imgPath: "assets/images/ic_menu_2.png",
        name: 'Fridge',
        desc: "desc desc desc desc desc"),
    FixJidCategory(
        id: "3",
        imgPath: "assets/images/ic_menu_3.png",
        name: 'Window',
        desc: "desc desc desc desc desc"),
    FixJidCategory(
        id: "4",
        imgPath: "assets/images/ic_menu_4.png",
        name: 'Wash Machine',
        desc: "desc desc desc desc desc"),
    FixJidCategory(
        id: "5",
        imgPath: "assets/images/ic_menu_5.png",
        name: 'Carpenter',
        desc: "desc desc desc desc desc"),
    FixJidCategory(
        id: "6",
        imgPath: "assets/images/ic_menu_5.png",
        name: 'Electrician',
        desc: "desc desc desc desc desc"),
    FixJidCategory(
        id: "7",
        imgPath: "assets/images/ic_menu_7.png",
        name: 'Car',
        desc: "desc desc desc desc desc"),
    FixJidCategory(
        id: "8",
        imgPath: "assets/images/ic_menu_8.png",
        name: 'Clean',
        desc: "desc desc desc desc desc"),
    FixJidCategory(
        id: "9",
        imgPath: "assets/images/ic_menu_9.png",
        name: 'Construction',
        desc: "desc desc desc desc desc"),
    FixJidCategory(
        id: "10",
        imgPath: "assets/images/ic_menu_10.png",
        name: 'Desinfection',
        desc: "desc desc desc desc desc"),
    FixJidCategory(
        id: "11",
        imgPath: "assets/images/ic_menu_11.png",
        name: 'Desinfection',desc: "desc desc desc desc desc"),
    FixJidCategory(
        id: "12",
        imgPath: "assets/images/ic_menu_12.png",
        name: 'Desinfection',desc: "desc desc desc desc desc"),
    FixJidCategory(
        id: "13",
        imgPath: "assets/images/ic_menu_13.png",
        name: 'Desinfection',desc: "desc desc desc desc desc"),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
              child: Image(
                  image: AssetImage("assets/images/ic_shopping.png"),
                  width: 40,
                  height: 40,
                  fit: BoxFit.scaleDown),
            )
          ],
        ),
        drawer: navigationDrawer(),
        body: Container(
          color: Colors.white,
          child: Container(
              margin: EdgeInsets.only(top: 2.0),
              decoration: BoxDecoration(
                  color: kBackgroundWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0))),
              alignment: Alignment.center,
              child: renderHomeView()),
        ));
  }

  renderHomeView() {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: .7,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            children: [...menuList.map((e) => HomeCategoryItem(e))]));
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
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Home',
            // onTap: () =>
            // Navigator.pushReplacementNamed(context, pageRoutes.home),
          ),
          createDrawerBodyItem(
            icon: Icons.account_circle,
            text: 'Profile',
            // onTap: () =>
            // Navigator.pushReplacementNamed(context, pageRoutes.profile),
          ),
          createDrawerBodyItem(
            icon: Icons.event_note,
            text: 'Events',
            // onTap: () =>
            // Navigator.pushReplacementNamed(context, pageRoutes.event),
          ),
          Divider(),
          createDrawerBodyItem(
            icon: Icons.notifications_active,
            text: 'Notifications',
            // onTap: () =>
            // Navigator.pushReplacementNamed(context, pageRoutes.notification),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: 'Contact Info',
            // onTap: () =>
            // Navigator.pushReplacementNamed(context, pageRoutes.contact),
          ),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
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
                  image: AssetImage("assets/images/image_profile.png"),
                  fit: BoxFit.contain),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile picture
                  Flexible(
                    child: Container(
                      child: Text("Mohamed Ahmed"),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                            spreadRadius: 0)
                      ]),
                    ),
                  ),
                  // Rectangle 85
                  SizedBox(
                    height: 20.0,
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
                      "Edit Profile",
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
