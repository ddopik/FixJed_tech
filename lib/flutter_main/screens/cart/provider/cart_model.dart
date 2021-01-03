import 'package:flutter_base_app/flutter_main/screens/service/model/service.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class CartModel{
  getCartProduct({onSuccess, onError, serviceId, page}) {
    DIOManager().getCartProducts(
        onSuccess: (response) {
          List<FixJidService> servicesList = (response as List).map((model) => FixJidService.fromJson(model)).toList();
          onSuccess(servicesList);
        },
        onError: (errorResponse) {
          onError(errorResponse);
        },);
  }
}