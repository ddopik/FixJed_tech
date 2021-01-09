import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';

import 'main_services_list_view.dart';

// ignore: must_be_immutable
class ServiceFeaturesScreen extends StatelessWidget {
  FixJedCategory _fixJidCategory;

  @override
  Widget build(BuildContext context) {
    print("ServiceFeaturesScreen  build() ----> Called");
    _fixJidCategory = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: getPrimaryAppBar(context, _fixJidCategory.name),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

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
        child: MainServicesListView(fixJidCategory: _fixJidCategory),
      ),
    );
  }

  Widget getPrimaryAppBar(BuildContext context, title) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: french_blue,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(title),
      centerTitle: true,
      actions: [
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
    );
  }
}
