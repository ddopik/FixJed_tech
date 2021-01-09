import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/service.dart';
 
class HomeCategoryItem extends StatelessWidget {
  final FixJedCategory _fixJidCategory;

  HomeCategoryItem(this._fixJidCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.center,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                elevation: 5,
                child: ClipOval(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child:CustomImageLoader.image(url:_fixJidCategory.imageUrl,width: 80,height: 65,fit: BoxFit.contain),
                  ),
                ),
              ),
              Container(
                child: Text(
                  _fixJidCategory.name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
              ),
            ],
          ),
        );
  }
}
