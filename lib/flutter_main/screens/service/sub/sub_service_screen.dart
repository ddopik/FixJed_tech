import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/service.dart';
 import 'package:flutter_base_app/flutter_main/screens/service/sub/sub_service_list_view.dart';

// ignore: must_be_immutable
class SubServicesFeaturesScreen extends StatelessWidget {
  FixJidService _fixJidCategory;

  @override
  Widget build(BuildContext context) {
    _fixJidCategory = ModalRoute.of(context).settings.arguments;
    if(_fixJidCategory != null && _fixJidCategory is FixJidService){
    return Scaffold(
      appBar: getPrimaryAppBar(context, _fixJidCategory.name),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: kBackgroundWhite,
            border: Border.all(
              color: kBackgroundWhite,
              width: 1.0,
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28.0),
                topRight: Radius.circular(28.0))),
        child: SubFeaturesListView(service: _fixJidCategory),
      ),
    );
    }else{
      throw "SubServicesFeatures ----> Failed to pares Service ";
    }
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
          child: Image(
              image: AssetImage("assets/images/ic_shopping.png"),
              width: 40,
              height: 40,
              fit: BoxFit.scaleDown),
        )
      ],
    );
  }
}
