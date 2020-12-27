import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/screens/home/home_category_item.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/service.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homePage';

  List<FixJidService> menuList = [
    FixJidService(
        serviceId: "1",
        serviceImage: "assets/images/ic_menu_8.png",
        serviceName: 'Plumber',
        serviceDesc: "desc desc desc desc desc"),
    FixJidService(
        serviceId: "2",
        serviceImage: "assets/images/ic_menu_2.png",
        serviceName: 'Fridge',
        serviceDesc: "desc desc desc desc desc"),
    FixJidService(
        serviceId: "3",
        serviceImage: "assets/images/ic_menu_3.png",
        serviceName: 'Window',
        serviceDesc: "desc desc desc desc desc"),
    FixJidService(
        serviceId: "4",
        serviceImage: "assets/images/ic_menu_4.png",
        serviceName: 'Wash Machine',
        serviceDesc: "desc desc desc desc desc"),
    FixJidService(
        serviceId: "5",
        serviceImage: "assets/images/ic_menu_5.png",
        serviceName: 'Carpenter',
        serviceDesc: "desc desc desc desc desc"),
    FixJidService(
        serviceId: "6",
        serviceImage: "assets/images/ic_menu_5.png",
        serviceName: 'Electrician',
        serviceDesc: "desc desc desc desc desc"),
    FixJidService(
        serviceId: "7",
        serviceImage: "assets/images/ic_menu_7.png",
        serviceName: 'Car',
        serviceDesc: "desc desc desc desc desc"),
    FixJidService(
        serviceId: "8",
        serviceImage: "assets/images/ic_menu_8.png",
        serviceName: 'Clean',
        serviceDesc: "desc desc desc desc desc"),
    FixJidService(
        serviceId: "9",
        serviceImage: "assets/images/ic_menu_9.png",
        serviceName: 'Construction',
        serviceDesc: "desc desc desc desc desc"),
    FixJidService(
        serviceId: "10",
        serviceImage: "assets/images/ic_menu_10.png",
        serviceName: 'Desinfection',
        serviceDesc: "desc desc desc desc desc"),
    FixJidService(
        serviceId: "11",
        serviceImage: "assets/images/ic_menu_11.png",
        serviceName: 'Desinfection',
        serviceDesc: "desc desc desc desc desc"),
    FixJidService(
        serviceId: "12",
        serviceImage: "assets/images/ic_menu_12.png",
        serviceName: 'Desinfection',
        serviceDesc: "desc desc desc desc desc"),
    FixJidService(
        serviceId: "13",
        serviceImage: "assets/images/ic_menu_13.png",
        serviceName: 'Desinfection',
        serviceDesc: "desc desc desc desc desc"),
  ];

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
                  child: renderHomeView(context)),
            )));
  }

  renderHomeView(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: .7,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            children: [
              ...menuList.map((e) {
                return InkWell(
                  child: HomeCategoryItem(e),
                  onTap: () {
                    print("HomeCategoryItem OnTap ---> "+e.serviceId.toString());
                    Navigator.of(context)
                        .pushNamed(Routes.SERVICE_FEATURES, arguments: e);
                  },
                );
              })
            ]));
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
          Container(
            margin: EdgeInsets.all(14.0),
            child: Text(S.of(context).signOut,
                style: TextStyle(
                    color: boring_green, fontWeight: FontWeight.w600)),
            alignment: Alignment.center,
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
