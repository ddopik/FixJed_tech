import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/CircleImageWidget.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/DashedLineVerticalPainter.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:flutter_base_app/flutter_main/screens/request_screen/call_operator_slide_dialog_view.dart';
import 'package:flutter_base_app/generated/l10n.dart';

Future<void> submitOrderConfirmDialog(BuildContext context, Transaction request,
    {Function onTransactionConfirmClick}) {
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
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * .95,
          height: MediaQuery.of(context).size.height * .38,
          decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage("assets/images/bgdialog.png"),
                fit: BoxFit.fill,
              )),
          child: getView(context, request, onTransactionConfirmClick),
        ),
      );
    },
  );
}

Widget getView(BuildContext context, Transaction transaction,
    Function onTransactionConfirmClick) {
  return Column(
    children: [
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(outer_boundary_field_space),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  width: MediaQuery.of(context).size.width * .12,
                  height: MediaQuery.of(context).size.width * .12,
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
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
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
                    AutoSizeText(transaction.categoryJobType ?? "service",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              fontWeight: FontWeight.w400,
                            )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Row(
                      children: [
                        AutoSizeText(
                            parseDateFormat_1(transaction.transactionDate),
                            textAlign: TextAlign.start,
                            style:
                                Theme.of(context).textTheme.headline3.copyWith(
                                      fontWeight: FontWeight.w400,
                                    )),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      height: MediaQuery.of(context).size.height * .03,
                      child: AutoSizeText(transaction.transactionAddress ?? '',
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                fontWeight: FontWeight.w400,
                              )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .40,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(S.current.total,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xffffffff),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
                          Text(transaction.totalCost.toString() ?? " 0 " + S.current.egp,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xffffffff),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      customActionButton(
          btnText: Text(
            S.current.confirmPayment,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white, fontSize: text_size_1),
          ),
          width: MediaQuery.of(context).size.width * .75,
          btnColor: Color(0xff61ba66),
          btnRadius: 7.0,
          onPressed: () {
            onTransactionConfirmClick();
          }),
      SizedBox(
        height: MediaQuery.of(context).size.height * .01,
      ),
      GestureDetector(
        child: Text(S.current.havingProblemText_1,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Color(0xffffffff),
              fontSize: 9,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            )),
        onTap: () {
          callOperatorDialogView(
              context: context,
              barrierColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              pillColor: Colors.transparent);
        },
      )
    ],
  );
}

getProfileImage(BuildContext context) {
  return Container(
    child: CircleImageWidget(
      url: default_profile_img,
      fit: BoxFit.contain,
      width: MediaQuery.of(context).size.width * .15,
      height: MediaQuery.of(context).size.width * .15,
      borderColor: Colors.white,
      borderWidth: 2,
    ),
  );
}
