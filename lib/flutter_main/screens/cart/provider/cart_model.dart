import 'package:flutter_base_app/flutter_main/screens/cart/model/cart_response.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class CartModel {
  getCartProduct({onSuccess, onError, serviceId, page}) {
    DIOManager().getCartProducts(
      onSuccess: (response) {
        try {
          if (response != null) {
            CartResponse cartResponse = CartResponse.fromJson(response);
            onSuccess(cartResponse);
          } else {
            onSuccess(null);
          }
        } catch (e) {
          onSuccess(null);
        }
      },
      onError: (errorResponse) {
        onError(errorResponse);
      },
    );
  }

  removeProductFromCart({onSuccess, onError, serviceId}) {
    DIOManager().removeProductFromCart(
        onSuccess: (response) {
          onSuccess(true);
        },
        onError: (errorResponse) {
          onError(errorResponse);
        },
        productId: serviceId);
  }

  removeCategoryFromCart({onSuccess, onError, serviceId}) {
    DIOManager().removeCategoryFromCart(
        onSuccess: (response) {
          onSuccess(true);
        },
        onError: (errorResponse) {
          onError(errorResponse);
        },
        productId: serviceId);
  }
}
