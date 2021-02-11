import 'package:flutter_base_app/flutter_main/screens/transaction/model/transaction.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class TransactionModel {
  getAllTransaction({onSuccess, onError, transactionItemType}) {
    DIOManager().getAllTransaction(onSuccess: (response) {
      List<Transaction> data = (response as List)
          .map((model) => Transaction.fromJson(model))
          .toList();
      return (data.length > 0) ? onSuccess(data) : [];
    }, onError: (errorResponse) {
      onError(errorResponse);
    });
  }
}
