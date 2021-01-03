import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/product.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/service.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class ProductModel extends ChangeNotifier {
  FixJidService currentSelectedCategory;

  getCategoryServiceList({onSuccess, onError, categoryId, page}) {
    DIOManager().getSubCategory(
        onSuccess: (response) {
          List<FixJidService> servicesList = (response as List)
              .map((model) => FixJidService.fromJson(model))
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

  removeProductFromCart({onSuccess, onError, productID}) {
    DIOManager().removeProductFromCart(
        onSuccess: (response) {
          onSuccess(true);
        },
        onError: (errorResponse) {
          onError(errorResponse);
        },
        productId: productID);
  }



}
