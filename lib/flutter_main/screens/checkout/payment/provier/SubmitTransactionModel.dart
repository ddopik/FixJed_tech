import 'package:flutter_base_app/network/dio_manager.dart';

class SubmitTransactionModel {
  submitOrder({addressId, onSuccess, onError}) {

    print("submitTransaction --> "+addressId.toString());

    DIOManager().submitTransaction(
      addressId: addressId,
      paymentId:1,
      onSuccess: (response) {
        onSuccess(response);
      },
      onError: (errorResponse) {
        onError(errorResponse);
      },
    );
  }
}
