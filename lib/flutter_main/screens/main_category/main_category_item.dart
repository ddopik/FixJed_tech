import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';

class HomeCategoryItem extends StatelessWidget {
  final FixJedCategory _fixJidCategory;

  HomeCategoryItem(this._fixJidCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0)),
            elevation: 5,
            child: ClipOval(
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: CustomImageLoader.image(
                    url: _fixJidCategory.imageUrl,
                    width: 75,
                    height: 75,
                    fit: BoxFit.contain),
              ),
            ),
          ),
          Container(

            child: AutoSizeText(
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
