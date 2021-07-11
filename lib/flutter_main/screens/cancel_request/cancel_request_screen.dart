import 'package:auto_size_text/auto_size_text.dart';
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
  List reasons = [
    {
      'reason': S.current.customerWasntAthome,
      'id': DeliveredCancelReason.CUSTOMER_NOT_AT_HOME
    },
    {
      'reason': S.current.customerDidntAnswer,
      'id': DeliveredCancelReason.CUSTOMER_NOT_ANSWER_CALLS
    },
    {
      'reason': S.current.customerAskedToCancel,
      'id': DeliveredCancelReason.CUSTOMER_ASKED_ME_TO_CANCEL
    },
    {
      'reason': S.current.customerIsRude,
      'id': DeliveredCancelReason.CUSTOMER_IS_RUDE
    },
    {
      'reason': S.current.othersAndIneedOneofOperationstoContactMe,
      'id': DeliveredCancelReason.OTHER_OPERATIONS_TO_CONTACT_ME
    },
  ];

  var id;


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
                  child: AutoSizeText(S.current.cancellationReason,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Color(0xffffffff),
                          ))),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .5,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: ListView.builder(
                      itemCount: reasons.length,
                      itemBuilder: (context, i) {
                        return Row(
                          children: [
                            Radio(
                                activeColor: nasty_green,
                                fillColor:
                                    MaterialStateProperty.all(nasty_green),
                                value: reasons[i]['id'],
                                groupValue: id,
                                onChanged: (val) {
                                  setState(() {
                                    id = reasons[i]['id'];
                                    print(id);
                                  });
                                }),
                            Expanded(
                                child: Text('${reasons[i]['reason']}',
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .copyWith(color: Color(0xffffffff)))),
                          ],
                        );
                      })),
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              InkWell(
                child: Container(
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.width * .86,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: nasty_green,
                        borderRadius: BorderRadius.circular(8)),
                    child: AutoSizeText(
                      S.current.submit,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.white, fontSize: text_size_1),
                    )),
                onTap: () {
                  if (id == null) {
                    showError(S.current.pleaseSelectReason);
                  } else {
                    submitReasonId(
                        reasonId: id,
                        onSuccess: (response) {
                          hideLoading();
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.of(context)
                                .pushNamed(Routes.ORDER_SUBMISSION_FEEDBACK);
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

  submitReasonId({Function onSuccess, Function onError, reasonId}) {
    showLoading(context);
    DIOManager().submitId(
        onSuccess: (response) {
          onSuccess(response);
        },
        onError: (response) {
          onError(response);
        },
        reasonId: reasonId,
        transactionId: 2);
  }
}
enum DeliveredCancelReason {
  CUSTOMER_NOT_AT_HOME,
  CUSTOMER_NOT_ANSWER_CALLS,
  CUSTOMER_ASKED_ME_TO_CANCEL,
  CUSTOMER_IS_RUDE,
  OTHER_OPERATIONS_TO_CONTACT_ME
}