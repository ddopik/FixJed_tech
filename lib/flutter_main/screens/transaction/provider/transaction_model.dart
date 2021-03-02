import 'package:flutter_base_app/flutter_main/screens/transaction/model/transaction.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class TransactionModel {
  getTransaction({onSuccess, onError, transactionItemType}) {
    DIOManager().getTransaction(
        onSuccess: (response) {
          List<Transaction> data = (response as List)
              .map((model) => Transaction.fromJson(model))
              .toList();
          return (data.length > 0) ? onSuccess(data) : [];
        },
        onError: (errorResponse) {
          onError(errorResponse);
        },
        transactionItemType: transactionItemType);
  }

  cancelTransaction({onSuccess, onError, transaction}) {
    DIOManager().cancelTransaction(
        onSuccess: (response) {
          onSuccess();
        },
        onError: (errorResponse) {
          onError(errorResponse);
        },
        transactionId: transaction.id);
  }
}
