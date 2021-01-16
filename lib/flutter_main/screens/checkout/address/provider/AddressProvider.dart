import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/savedAddressResponse.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class AddressModel{
 getSavedAddress({onSuccess, onError, page}) {
    DIOManager().getSavedAddress(
      onSuccess: (response) {
        // SavedAddressResponse savedAddressResponse = SavedAddressResponse.fromJson(response);
        // onSuccess(savedAddressResponse);
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