import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/screens/home/model/FixJidCategory.dart';

class HomeCategoryItem extends StatelessWidget {
  final FixJidCategory _fixJidCategory;

  HomeCategoryItem(this._fixJidCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {},
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
                    child: Image(
                      fit: BoxFit.contain,
                      width: 80,
                      height: 80,
                      image: AssetImage(_fixJidCategory.imgPath),
                    ),
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
        ));
  }
}
