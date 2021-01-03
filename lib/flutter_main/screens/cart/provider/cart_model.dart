import 'package:flutter_base_app/flutter_main/screens/cart/model/cart_response.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/product.dart';
import 'package:flutter_base_app/flutter_main/screens/service/model/service.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class CartModel{
  getCartProduct({onSuccess, onError, serviceId, page}) {
    DIOManager().getCartProducts(
        onSuccess: (response) {
          List<CartResponse> servicesList = (response as List).map((model) => CartResponse.fromJson(model)).toList();
          onSuccess(servicesList);
        },
        onError: (errorResponse) {
          onError(errorResponse);
        },);
  }
}