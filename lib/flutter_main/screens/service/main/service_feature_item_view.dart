import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';

class ServiceFeatureItemView extends StatelessWidget {
  final FixJedCategory service;

  ServiceFeatureItemView({this.service});

  @override
  Widget build(BuildContext context) {
// return Container(width: 200,height: 200,color: Colors.white70,);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      elevation: 2.0,
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .18,
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
                        height: 12.0,
                      ),
                      Text(
                        service.name,
                        style: TextStyle(
                            color: french_blue,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Tajawal",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .47,
                        height: MediaQuery.of(context).size.height * .1,
                        child: Text(
                          service.description ??
                              " description description description description",
                          style: TextStyle(
                              color: Color(0xd9275597),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Tajawal",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // renderFeaturesList(),
          ],
        ),
      ),
    );
  }
}
