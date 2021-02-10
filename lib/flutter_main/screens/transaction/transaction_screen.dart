import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/transaction/transaction_item_view.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class TransactionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransactionScreenState();
  }
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
            tabs: [
              Tab(text: S.of(context).canceled),
              Tab(text: S.of(context).confirmed),
              Tab(text: S.of(context).onGoing),
              Tab(text: S.of(context).pending),
              Tab(text: S.of(context).all),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TransactionListView(transactionItemType: TransactionItemType.ALL,),
            TransactionListView(),
            TransactionListView(),
            TransactionListView(),
            TransactionListView(),
          ],
        ),
      ),
    );
  }
}
