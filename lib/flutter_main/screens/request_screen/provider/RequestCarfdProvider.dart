import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class RequestCardProvider {
  getRequestInfo({String id, Function onSuccess, onError}) {
    DIOManager().getRequestInfo(
        serviceId: id,
        onSuccess: (response) {
          var request = Request.fromJson(response);
          onSuccess(request);
        },
        onError: (error) {
          onError(error);
        });
  }
}
