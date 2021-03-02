import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/transaction/provider/transaction_model.dart';
import 'package:flutter_base_app/flutter_main/screens/transaction/transaction_item_view.dart';
import 'package:flutter_base_app/flutter_main/screens/transaction/transaction_list_view.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class TransactionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransactionScreenState();
  }
}

class _TransactionScreenState extends State<TransactionScreen> {
  TransactionModel _transactionModel;

  @override
  void initState() {
    _transactionModel = TransactionModel();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 60,
          bottom: TabBar(
            labelColor: french_blue,
            unselectedLabelColor: french_blue,
            indicatorColor: boring_green,
            indicatorWeight: 3.5,
            labelStyle: TextStyle(fontWeight: FontWeight.w700),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
            tabs: getTabAddressList(),
          ),
        ),
        body: TabBarView(
          children: getTabViewList(),
        ),
      ),
    );
  }

  List<Tab> getTabAddressList() {
    List<Tab> list = [
      Tab(text: S.of(context).canceled),
      Tab(text: S.of(context).confirmed),
      Tab(text: S.of(context).delivered),
      Tab(text: S.of(context).pending),
      Tab(text: S.of(context).all)
    ];
    return list.reversed.toList();
  }

  List<Widget> getTabViewList() {
    List<TransactionListView> list = [
      TransactionListView(
        transactionItemType: TransactionItemType.CANCELED,
      ),
      TransactionListView(transactionItemType: TransactionItemType.CONFIRMED),
      TransactionListView(transactionItemType: TransactionItemType.DELIVERED),
      TransactionListView(
        transactionItemType: TransactionItemType.PENDING,
      ),
      TransactionListView(transactionItemType: TransactionItemType.ALL),
    ];
    return list.reversed.toList();
  }
}
