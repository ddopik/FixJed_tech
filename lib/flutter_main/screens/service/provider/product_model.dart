import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/product.dart';
 import 'package:flutter_base_app/network/dio_manager.dart';

class ProductModel extends ChangeNotifier {
  FixJedCategory currentSelectedCategory;

  getCategoryServiceList({onSuccess, onError, categoryId, page}) {
    DIOManager().getSubCategory(
        onSuccess: (response) {
          List<FixJedCategory> servicesList = (response as List)
              .map((model) => FixJedCategory.fromJson(model))
              .toList();
          onSuccess(servicesList);
        },
        onError: (errorResponse) {
          onError(errorResponse);
        },
        categoryId: categoryId);
  }

  getServicesProducts({onSuccess, onError, serviceId, page}) {
    DIOManager().getServiceProduct(
        onSuccess: (response) {
          List<Product> servicesList = (response as List)
              .map((model) => Product.fromJson(model))
              .toList();
          onSuccess(servicesList);
        },
        onError: (errorResponse) {
          onError(errorResponse);
        },
        serviceId: serviceId);
  }

  addProductToCart({onSuccess, onError, productID}) {
    DIOManager().addProductToCart(
        onSuccess: (response) {

          onSuccess(true);
        },
        onError: (errorResponse) {
          onError(errorResponse.toString());
        },
        productId: productID);
  }

  subtractProductFromCart({onSuccess, onError, productID}) {
    DIOManager().subtractProductFromCart(
        onSuccess: (response) {
          onSuccess(true);
        },
        onError: (errorResponse) {
          onError(errorResponse);
        },
        productId: productID);
  }



}
