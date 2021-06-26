import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/provider/TransactionModel.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/view/RequestsListView.dart';
import 'package:provider/provider.dart';

import 'In_coming_order_dialog.dart';
import 'calender_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TransactionModel>(context, listen: false)
          .getInComingTransactions(
              onSuccess: () {
                checkIncomingListeners(
                    Provider.of<TransactionModel>(context, listen: false)
                        .allInComingRequest);
              },
              onError: (error) {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TransactionModel>.value(
      value: Provider.of<TransactionModel>(context),
      builder: (
        context,
        value,
      ) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _checkCurrentRunningTransaction();
        });

        return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Welcome, abdo "),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.repeat_one_outlined),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(Routes.NOTIFICATION_SCREEN);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(22),
                  child: Column(
                    children: [
                      getCalenderView(),
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .38,
                            child: RequestsListView(),
                          ),
                          Container(
                            /// just overlay to prevent list item listener
                            height: MediaQuery.of(context).size.height * .38,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Routes.ALL_REQUESTS);
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
            ));
      },
    );
  }

  Widget getCalenderView() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 6, left: 6, right: 6),
          child: Card(
              color: Colors.white.withOpacity(0.800000011920929),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              elevation: 2.0,
              child: Container(
                child: CalenderView(),
              )),
        ),
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 2.0,
            child: Container(
              child: CalenderView(
                onDateSelected: (DateTime date) {
                  print("Current Selected Date is " + date.toString());
                },
              ),
            ))
      ],
    );
  }

  _checkCurrentRunningTransaction() {
    var currentRunningTransaction = getRunningTransaction(
        Provider.of<TransactionModel>(context, listen: false)
            .allConfirmedRequest);
    if (currentRunningTransaction != null) {
      Navigator.of(context).pushNamed(Routes.COUNTER_SCREEN,
          arguments: currentRunningTransaction);
    }
  }

  checkIncomingListeners(List<Transaction> requestList) async {
    print("initListeners with   -> " + requestList.length.toString());
    var newrequestList = [];
    newrequestList.addAll(requestList);
    for (Transaction transaction in newrequestList) {
      print("transaction ID --->" +
          transaction.technicianTransactionId.toString() +
          " --");
      await showInComingOrderDialog(context, transaction);
    }

    Provider.of<TransactionModel>(context, listen: false)
        .getInComingTransactions(onSuccess: () {}, onError: (err) {});
  }

  Transaction getRunningTransaction(List<Transaction> transactionList) {
    for (Transaction transaction in transactionList) {
      print("Condition is true");
      if (transaction.startDate != null &&
          transaction.endDate == null &&
          transaction.technicianStatus == "CONFIRMED") {
        return transaction;
      }
    }

    return null;
  }
}
