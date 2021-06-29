import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/constants.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/app_bar_back_button.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/provider/TransactionModel.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class CancelRequestScreen extends StatefulWidget {
  final arguments;

  CancelRequestScreen({this.arguments});

  @override
  State<StatefulWidget> createState() {
    return CancelRequestScreenState();
  }
}

class CancelRequestScreenState extends State<CancelRequestScreen> {
  var currentReasonId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: AppBarBackButton(),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: inner_boundary_field_space_wide,
            right: inner_boundary_field_space_wide,
            bottom: inner_boundary_field_space_wide),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * .62,
                  padding: EdgeInsets.all(inner_boundary_field_space_wide),
                  child: Text(S.current.cancelReason,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Color(0xffffffff),
                          ))),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .33,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: ListView.builder(
                      itemCount: Constants.cancelingReasonsList().length,
                      itemBuilder: (context, i) {
                        return Row(
                          children: [
                            Radio(
                                activeColor: nasty_green,
                                fillColor:
                                    MaterialStateProperty.all(nasty_green),
                                value: Constants.cancelingReasonsList()[i]
                                    ['id'],
                                groupValue: currentReasonId,
                                onChanged: (val) {
                                  setState(() {
                                    currentReasonId =
                                        Constants.cancelingReasonsList()[i]
                                            ['id'];
                                    print(currentReasonId);
                                  });
                                }),
                            Expanded(
                                child: Text(
                                    '${Constants.cancelingReasonsList()[i]['reason']}',
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .copyWith(color: Color(0xffffffff)))),
                          ],
                        );
                      })),
              SizedBox(
                height: MediaQuery.of(context).size.height * .4,
              ),
              InkWell(
                child: Container(
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.width * .86,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: nasty_green,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      S.current.submit,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.white, fontSize: text_size_1),
                    )),
                onTap: () {
                  if (currentReasonId == null) {
                    showError(S.current.pleaseSelectDeclineReason);
                  } else {
                    showLoading(context);
                    Provider.of<TransactionModel>(context, listen: false)
                        .submitCancelTransactionReason(
                            transactionId:
                                widget.arguments.technicianTransactionId,
                            reasonId: currentReasonId,
                            onSuccess: (response) {
                              hideLoading();

                              /// to refresh and navigate to home screen
                              Provider.of<TransactionModel>(context,
                                      listen: false)
                                  .getConfirmedTransactions(
                                      onSuccess: (response) {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    Routes.HOME, (route) => false);
                              }, onError: (error) {
                                showError(response);
                              });
                            },
                            onError: (response) {
                              hideLoading();
                              showError(response);
                            });
                  }
                },
              )
            ]),
      ),
    );
  }
}
