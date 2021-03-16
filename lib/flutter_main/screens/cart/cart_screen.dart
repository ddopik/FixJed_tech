import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/navigation_app_back_icon.dart';
import 'package:flutter_base_app/generated/l10n.dart';

import 'cart_list_view.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartScreenState();
  }
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(S.of(context).cart),
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
        padding: EdgeInsets.symmetric(vertical: 21),
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
        child: CartListView(),
      ),
    );
  }
}
