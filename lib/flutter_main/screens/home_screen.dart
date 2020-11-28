import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homePage';

  List<_MenuItem> menuList = [
    _MenuItem("assets/images/ic_menu_8.png", 'Plumber'),
    _MenuItem("assets/images/ic_menu_2.png", 'Fridge'),
    _MenuItem("assets/images/ic_menu_3.png", 'Window'),
    _MenuItem("assets/images/ic_menu_4.png", 'Wash Machine'),
    _MenuItem("assets/images/ic_menu_5.png", 'Carpenter'),
    _MenuItem("assets/images/ic_menu_5.png", 'Electrician'),
    _MenuItem("assets/images/ic_menu_7.png", 'Car'),
    _MenuItem("assets/images/ic_menu_8.png", 'Clean'),
    _MenuItem("assets/images/ic_menu_9.png", 'Construction'),
    _MenuItem("assets/images/ic_menu_10.png", 'Desinfection'),
    _MenuItem("assets/images/ic_menu_11.png", 'Desinfection'),
    _MenuItem("assets/images/ic_menu_12.png", 'Desinfection'),
    _MenuItem("assets/images/ic_menu_13.png", 'Desinfection'),
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
        body: Center(child: renderHomeView()));
  }

  renderHomeView() {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(crossAxisCount: 3,
            childAspectRatio: .8,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 0.0,
            crossAxisSpacing:0.0,
            children: [ ...menuList.map((e) => getGridViewItem(e))])
    );
  }

  getGridViewItem(_MenuItem _menuItem) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
            onTap: () {},
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image(
                          fit: BoxFit.scaleDown,
                          width: 60,
                          height: 60,
                          image: AssetImage(_menuItem.imgPath),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      _menuItem.title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
            )));
  }
}


class _MenuItem {
  final String imgPath;
  final String title;

  _MenuItem(this.imgPath, this.title);
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
