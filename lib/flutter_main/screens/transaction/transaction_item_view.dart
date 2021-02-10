import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/flutter_main/screens/transaction/model/Transaction.dart';

class TransactionListView extends StatelessWidget {
  final Transaction transaction;
  final TransactionItemType transactionItemType;
  final Function onCancelTransactionClick;

  const TransactionListView(
      {this.transaction,
      this.transactionItemType,
      this.onCancelTransactionClick});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

enum TransactionItemType { ALL, PENDING, CANCELED, ON_GOING }
