import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/constants.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/CircleImageWidget.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/DashedLineVerticalPainter.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/flutter_main/screens/home/regect_order_reason_dialog.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/provider/TransactionModel.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:provider/provider.dart';

Future<void> showInComingOrderDialog(
    BuildContext context, Transaction request) {
  return showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    elevation: 120,
    context: context,
    isDismissible: false,
    enableDrag: false,
    builder: (BuildContext context) {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * .95,
              height: MediaQuery.of(context).size.height * .27,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage("assets/images/bgdialog.png"),
                    fit: BoxFit.fill,
                  )),
              child: getView(context, request),
            )
          ],
        ),
      );
    },
  );
}

Widget getView(BuildContext context, Transaction transaction) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(outer_boundary_field_space),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getProfileImage(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
              child: CustomPaint(
                  size: Size(1, double.infinity),
                  painter: DashedLineVerticalPainter()),
            ),
            CircleImageWidget(
              url: transaction.categoryUrl ?? '',
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * .15,
              height: MediaQuery.of(context).size.width * .15,
              borderColor: Colors.white,
              borderWidth: 2,
            )
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.height * .01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                AutoSizeText(transaction.customerName ?? "Customer name",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(fontSize: text_size_1)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                AutoSizeText("Service type here",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          fontWeight: FontWeight.w400,
                        )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Row(
                  children: [
                    AutoSizeText("25th of July 2021",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              fontWeight: FontWeight.w400,
                            )),
                    AutoSizeText("12:00 PM",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              fontWeight: FontWeight.w400,
                            ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                  width: MediaQuery.of(context).size.width * .5,
                  child: AutoSizeText(transaction.transactionAddress ?? '',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            fontWeight: FontWeight.w400,
                          )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .53,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customActionButton(
                          btnText: Text(
                            S.current.decline,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    color: Colors.grey, fontSize: text_size_1),
                          ),
                          width: MediaQuery.of(context).size.width * .25,
                          btnColor: Color(0xFFEDEDED),
                          btnRadius: 7.0,
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              isDismissible: true,
                              backgroundColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: RejectTransactionReasonDialogView(
                                      reasonList:
                                          Constants.getDeclineReasonsList(),
                                      transaction: transaction,
                                      onRejectSuccess: (response) {
                                        Navigator.of(context).pop();
                                      }),
                                );
                              },
                            );
                          }),
                      customActionButton(
                          btnText: Text(
                            S.current.accept,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    color: Colors.white, fontSize: text_size_1),
                          ),
                          width: MediaQuery.of(context).size.width * .25,
                          btnColor: Color(0xff61ba66),
                          btnRadius: 7.0,
                          onPressed: () async {
                            showLoading(context);
                            Provider.of<TransactionModel>(context,
                                    listen: false)
                                .acceptInComingTransaction(
                                    id: transaction.technicianTransactionId
                                        .toString(),
                                    onSuccess: () {
                                      hideLoading();
                                      Navigator.of(context).pop();
                                    },
                                    onError: (error) {
                                      hideLoading();
                                    });
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

getProfileImage(BuildContext context) {
  return Container(
    child: CircleImageWidget(
      url: default_profile_img,
      fit: BoxFit.contain,
      width: MediaQuery.of(context).size.width * .17,
      height: MediaQuery.of(context).size.width * .17,
      borderColor: Colors.white,
      borderWidth: 2,
    ),
  );
}
