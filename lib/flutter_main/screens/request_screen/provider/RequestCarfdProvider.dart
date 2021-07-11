import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class RequestCardProvider {
  getRequestInfo({String id, Function onSuccess, onError}) {
    DIOManager().getRequestInfo(
        transactionID: id,
        onSuccess: (response) {
          var request = Transaction.fromJson(response);
          onSuccess(request);
        },
        onError: (error) {
          onError(error);
        });
  }

  acceptTransaction({String id, Function onSuccess, onError}) {
    DIOManager().acceptTransaction(
        transactionId: id,
        onSuccess: (response) {
          onSuccess();
        },
        onError: (error) {
          onError(error);
        });
  }

  cancelTransaction({String id, Function onSuccess, onError}) {
    DIOManager().cancelTransaction(
        transactionId: id,
        onSuccess: (response) {
          onSuccess();
        },
        onError: (error) {
          onError(error);
        });
  }
}
