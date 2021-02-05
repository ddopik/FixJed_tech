import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class AddressModel {
  getSavedAddress({onSuccess, onError, page}) {
    DIOManager().getSavedAddress(
      onSuccess: (response) {
        List<Address> aAddressList =
            (response as List).map((model) => Address.fromJson(model)).toList();
        onSuccess(aAddressList);
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
}
