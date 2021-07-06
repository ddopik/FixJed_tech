import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class PastOrderModel {
  getPastOrder({onSuccess, onError}) {
    DIOManager().getPastOrder(onSuccess: (response) {
      List<Transaction> data = (response as List)
          .map((model) => Transaction.fromJson(model))
          .toList();
      onSuccess(data);
    }, onError: (error) {
      onError(error.toString());
    });
  }
}
