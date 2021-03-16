import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/navigation_app_back_icon.dart';
import 'package:flutter_base_app/generated/l10n.dart';

import 'addressListView.dart';

class AddressListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddressListScreenState();
  }
}

class _AddressListScreenState extends State<AddressListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).savedPlaces),
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(getBackNavigationIcon(context), color: french_blue),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background_2.png"),
                    fit: BoxFit.cover),
                border: Border.all(
                  color: kBackgroundWhite,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.0),
                    topRight: Radius.circular(28.0))),
            child: AddressListView()));
  }
}
