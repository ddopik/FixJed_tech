import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/flutter_main/common/constants.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/requests_group.dart';
import 'package:flutter_base_app/network/dio_manager.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

class TransactionModel extends ChangeNotifier {
  List<Transaction> allConfirmedRequest = [];

  EventList<Event> allEventRequest = EventList();
  List<Transaction> allInComingRequest = [];

  getConfirmedTransactions({onSuccess, onError}) async {
    DIOManager().getApprovedTransaction(onSuccess: (response) {
      allConfirmedRequest.clear();
      var responseKeys = (response as Map).keys.toList();

      List<RequestsGroup> requestsGroupList = [];

      for (String key in responseKeys) {
        List<Transaction> dataResponse = (response[key] as List).map((model) {
          Transaction request = Transaction.fromJson(model);
          Event event =
              Event(date: DateTime.parse(request.transactionDate), title: "");
          allEventRequest.add(DateTime.parse(request.transactionDate), event);

          return request;
        }).toList();
        allConfirmedRequest.addAll(dataResponse);
        requestsGroupList.add(RequestsGroup(key, dataResponse));
      }

      onSuccess(requestsGroupList);
      notifyListeners();
    }, onError: (error) {
      onError(error.toString());
    });
  }

  getInComingTransactions({onSuccess, onError}) async {
    allInComingRequest.clear();
    DIOManager().getInComingTransaction(onSuccess: (response) {
      allInComingRequest = (response as List)
          .map((model) => Transaction.fromJson(model))
          .toList();

      print("getInComingTransactions ----> " +
          allInComingRequest.length.toString());
      onSuccess();
      notifyListeners();
    }, onError: (error) {
      onError(error.toString());
    });
  }

  acceptInComingTransaction({String id, onSuccess, onError}) async {
    DIOManager().acceptIncomingTransaction(
        transactionId: id,
        onSuccess: (response) {
          onSuccess();
        },
        onError: (error) {
          onError(error);
        });
  }

  declineInComingRequest(
      {String transactionId,
      AssignedCancelReason reasonId,
      reasonDesc,
      onSuccess,
      onError}) async {
    DIOManager().declineIncomingTransaction(
        transactionId: transactionId,
        reasonId: reasonId,
        reasonDesc: reasonDesc,
        onSuccess: (response) {
          onSuccess(response);
        },
        onError: (error) {
          onError(error);
        });
  }

  submitCancelTransactionReason(
      {Function onSuccess, Function onError, transactionId, reasonId}) {
    DIOManager().submitCancelTransactionReason(
        onSuccess: (response) {
          onSuccess(response);
        },
        onError: (response) {
          onError(response);
        },
        reasonId: reasonId,
        transactionId: transactionId);
  }

  endRequest({String id, onSuccess, onError}) async {
    DIOManager().endTransaction(
        transactionId: id,
        onSuccess: (response) {
          onSuccess();
        },
        onError: (error) {
          onError(error);
        });
  }
}
