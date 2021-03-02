import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:intl/intl.dart';

import 'model/transaction.dart';

class TransactionItemView extends StatelessWidget {
  final Transaction transaction;
  final TransactionItemType transactionItemType;
  final Function onCancelTransactionClick;
  var dateFormat = new DateFormat('yyyy-MM-dd');

  TransactionItemView(
      {this.transaction,
      this.transactionItemType,
      this.onCancelTransactionClick});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 2.0,
        child: Container(
            width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.height * .178,
            child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(children: [
                      // Ellipse 20
                      Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: getTransactionStateColor(), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: getTransactionStateColor())),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        transaction.categoriesNames.join(","),
                        style: const TextStyle(
                            color: french_blue,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Tajawal",
                            fontStyle: FontStyle.normal,
                            fontSize: 18.0),
                      )
                    ]),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "الطلب المقدم",
                              style: const TextStyle(
                                color: const Color(0xff646363),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Tajawal",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              transaction.addressName,
                              style: const TextStyle(
                                  color: const Color(0xff646363),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Tajawal",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                            ),
                            Text(
                              S.current.total +
                                  " : " +
                                  transaction.totalPrice.toString() +
                                  " " +
                                  S.current.egpPrice,
                              style: const TextStyle(
                                  color: const Color(0xff646363),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Tajawal",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                            ),
                            Row(
                              mainAxisAlignment: (transactionItemType ==
                                      TransactionItemType.PENDING)
                                  ? MainAxisAlignment.spaceAround
                                  : MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat.yMMMMd().format(
                                      DateTime.parse(transaction.createdDate)),
                                  style: const TextStyle(
                                      color: const Color(0xff646363),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Tajawal",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                ),
                                (transactionItemType ==
                                        TransactionItemType.PENDING)
                                    ? Expanded(
                                        child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            child: Container(
                                              width: 95,
                                              height: 30,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(22)),
                                                color: Colors.red,
                                              ),
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            onTap: () {
                                              onCancelTransactionClick(
                                                  transaction);
                                            },
                                          ),
                                        ],
                                      ))
                                    : Container()
                              ],
                            )
                          ]),
                    ),
                    // Rectangle 46
                  ],
                ))));
  }

  Color getTransactionStateColor() {
    switch (transactionItemType) {
      case TransactionItemType.ALL:
        {
          return getTransactionDynamicColor(transaction.transactionStatus);
        }
      case TransactionItemType.PENDING:
        return Color(0xfffcfb5a);
        break;
      case TransactionItemType.CANCELED:
        return Color(0xffe82d2d);
        break;
      case TransactionItemType.CONFIRMED:
        return Color(0xff6ee82d);
        break;
      case TransactionItemType.DELIVERED:
        return Color(0xff2d67e8);
        break;
    }
  }

  //Apply only for stats SUBMITTED
  Color getTransactionDynamicColor(type) {
    switch (type) {
      case "SUBMITTED":
        {
          return Color(0xff2de8e1);
        }
      case "PENDING":
        return Color(0xfffcfb5a);
        break;
      case "CANCELED":
        return Color(0xffe82d2d);
        break;
      case "CONFIRMED":
        return Color(0xff6ee82d);
        break;
      case "DELIVERED":
        return Color(0xff2d67e8);
        break;
    }
  }
}

// DateFormat.yMMMMd().format(now)
// DateTime.parse(transaction.createdDate).month,
enum TransactionItemType { ALL, PENDING, CANCELED, CONFIRMED, DELIVERED }
