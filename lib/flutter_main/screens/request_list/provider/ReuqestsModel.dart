import 'package:flutter_base_app/network/dio_manager.dart';

class RequestsModel {
  getRequests({onSuccess, onError}) {
    DIOManager().getApprovedRequests(onSuccess: (response) {
      var data = response;
      onSuccess(data);
    }, onError: (error) {
      onError(error.toString());
    });
  }
}
