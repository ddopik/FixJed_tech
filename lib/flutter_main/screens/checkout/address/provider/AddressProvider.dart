import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Region.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/city.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/savedAddressResponse.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class AddressModel{
 getSavedAddress({onSuccess, onError, page}) {
   Address address =Address();
   address.id=0;
   address.name="name";
   address.city=City();
   address.region=Region();

   return onSuccess([address,address,address,address]);
    DIOManager().getSavedAddress(
      onSuccess: (response) {
        // SavedAddressResponse savedAddressResponse = SavedAddressResponse.fromJson(response);

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