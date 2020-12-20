import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/feature.dart';

class FeatureListItemView extends StatelessWidget{

  final Feature features;
  FeatureListItemView({this.features});
  @override
  Widget build(BuildContext context) {
return Container(width: 200,height: 200,color: Colors.white70,);
    return Card(
      elevation: 2.0,
      child: Container(

        padding: EdgeInsets.all(14.0),
        child: Column(
          children: [
            Container(
              height: 120,
              child: Row(
                children: [
                  Image.asset(
                    features.featureImage,
                    fit: BoxFit.contain,
                  ),
                  CustomImageLoader.image(url: features.featureImage,fit: BoxFit.contain,size: kSize.medium),
                  SizedBox(width: 14.0,),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        features.featureName,
                        style: TextStyle(
                            color: boring_green,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Tajawal",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        features.featureDesc,
                        style: TextStyle(
                            color: Color(0xd9275597),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Tajawal",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                      )
                    ],
                  )
                ],
              ),

            ),

            // renderFeaturesList(),
          ],
        ),),
    );
  }

}