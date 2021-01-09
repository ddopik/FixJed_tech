import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class MainCategoryModel {
  getMainCategory({onSuccess, onError, page}) {
    DIOManager().getMainCategory(onSuccess: (response) {
      List<FixJedCategory> categoryList = (response as List)
          .map((model) => FixJedCategory.fromJson(model))
          .toList();
      onSuccess(categoryList);
    }, onError: (response) {
      logger.e(response);
      onError(response);
    });
  }
}
