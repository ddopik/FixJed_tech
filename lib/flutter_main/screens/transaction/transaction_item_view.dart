import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
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
        child: Container(
            width: MediaQuery.of(context).size.width * listWidthRation,
            height: MediaQuery.of(context).size.height * .28,
            padding: EdgeInsets.all(inner_boundary_field_space),
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
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: getTransactionStateColor())),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    transaction.categoriesNames.join(","),
                    style: const TextStyle(
                        color: french_blue,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Tajawal",
                        fontStyle: FontStyle.normal,
                        fontSize: text_size_1),
                  )
                ]),
                Column(
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
                            TransactionItemType.PENDING &&
                            timeAllowed(transaction.createdDate))
                            ? MainAxisAlignment.spaceAround
                            : MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat.yMMMMd().format(
                                    DateTime.parse(transaction.createdDate)),
                                style: const TextStyle(
                                    color: const Color(0xff646363),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Tajawal",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                              ),
                              Text(
                                  (transactionItemType ==
                                      TransactionItemType.PENDING)
                                      ? S.current.cancelOrderNote
                                      : '',
                                  style: const TextStyle(
                                      color: const Color(0x70646363),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Tajawal",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.7),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                          (transactionItemType ==
                              TransactionItemType.PENDING &&
                              timeAllowed(transaction.createdDate))
                              ? Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    child: Container(
                                      width: 100,
                                      height: 32,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(22)),
                                        color: Colors.red,
                                      ),
                                      child: Text(
                                        S.current.cancel,
                                        style: TextStyle(
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Tajawal",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                    onTap: () {
                                      onCancelTransactionClick(transaction);
                                    },
                                  ),
                                ],
                              ))
                              : Container()
                        ],
                      )
                    ]),
                // Rectangle 46
              ],
            )));
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
    }
  }

  bool timeAllowed(String currentDate) {
    DateTime parsedDate = DateTime.parse(transaction.createdDate);
    DateTime now = new DateTime.now();
    DateTime subDateTime =
        now.subtract(Duration(days: parsedDate.day, hours: parsedDate.hour));
    if (subDateTime.hour < 2) {
      return true;
    } else {
      return false;
    }
  }
}

enum TransactionItemType { ALL, PENDING, CANCELED, CONFIRMED, DELIVERED }
