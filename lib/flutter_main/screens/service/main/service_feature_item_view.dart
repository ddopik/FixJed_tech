import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';

class ServiceFeatureItemView extends StatelessWidget {
  final FixJedCategory service;

  ServiceFeatureItemView({this.service});

  @override
  Widget build(BuildContext context) {
// return Container(width: 200,height: 200,color: Colors.white70,);
    return Container(
      width: MediaQuery.of(context).size.width * listWidthRation,
      height: MediaQuery.of(context).size.height * .21,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(inner_boundary_field_space),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Color(0xffffffff)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomImageLoader.image(
              url: service.imageUrl,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * .23,
              height: MediaQuery.of(context).size.height * .3),
          SizedBox(
            width: 14.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: form_field_space,
              ),
              Text(
                service.name,
                style: TextStyle(
                    color: french_blue,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Tajawal",
                    fontStyle: FontStyle.normal,
                    fontSize: text_head_size_1),
              ),
              SizedBox(
                height: form_field_space,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .47,
                child: AutoSizeText(
                  service.description ??
                      " description description description description",
                  style: TextStyle(
                      color: Color(0xd9275597),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Tajawal",
                      fontStyle: FontStyle.normal,
                      fontSize: text_size_1),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
