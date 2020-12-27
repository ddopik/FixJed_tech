import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/service.dart';
 
class HomeCategoryItem extends StatelessWidget {
  final FixJidService _fixJidCategory;

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
                    child: Image(
                      fit: BoxFit.contain,
                      width: 80,
                      height: 80,
                      image: AssetImage(_fixJidCategory.serviceImage),
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  _fixJidCategory.serviceName,
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
