import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';

class RequestsGroup {
  final String date;
  final List<Transaction> requestList;

  RequestsGroup(this.date, this.requestList);
}
