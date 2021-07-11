import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/model/DeclineReason.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/provider/TransactionModel.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class RejectTransactionReasonDialogView extends StatefulWidget {
  final Transaction transaction;
  final List<DeclineReason> reasonList;
  final Function onRejectSuccess;

  RejectTransactionReasonDialogView(
      {this.reasonList, this.transaction, this.onRejectSuccess});

  @override
  State<StatefulWidget> createState() {
    return _RejectOrderReasonDialogState();
  }
}

class _RejectOrderReasonDialogState
    extends State<RejectTransactionReasonDialogView> {
  DeclineReason _currentSelectedReason;
  TextEditingController reasonDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * .95,
            height: MediaQuery.of(context).size.height * .43,
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage("assets/images/bgdialog.png"),
                  fit: BoxFit.fill,
                )),
            child: getView(context),
          )
        ],
      ),
    );
  }

  Widget getView(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            S.current.rejectionReason,
            style: Theme.of(context).textTheme.headline5,
          ),
          getReasonView(
            reasonList: widget.reasonList,
          )
        ],
      ),
    );
  }

  Widget getReasonView({List<DeclineReason> reasonList}) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .14,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              direction: Axis.horizontal,
              children: reasonList
                  .map((reason) => InkWell(
                        child: Container(
                          margin: EdgeInsets.all(6),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: _currentSelectedReason == reason
                                ? boring_green_light
                                : grayWhite,
                          ),
                          child: Text(
                            reason.data,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontSize: 10,
                                    color: _currentSelectedReason == reason
                                        ? fontGreen
                                        : Colors.grey),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _currentSelectedReason = reason;
                          });
                        },
                      ))
                  .toList(),
            ),
          ),
        ),
        SizedBox(height: list_separator_space),
        Container(
          width: MediaQuery.of(context).size.width * .8,
          height: 45,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    spreadRadius: 0)
              ],
              color: Color(0xFFEDEDED)),
          child: TextFormField(
            controller: reasonDescriptionController,
            cursorColor: Colors.black,
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
                hintText: S.of(context).writeYourRejectionReason,
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
        SizedBox(height: list_separator_space),
        InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width * .8,
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 0)
                ],
                color: boring_green),
            child: Text(
              S.of(context).submit,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          onTap: () {
            if (_currentSelectedReason != null) {
              Provider.of<TransactionModel>(context, listen: false)
                  .declineInComingRequest(
                      transactionId:
                          widget.transaction.technicianTransactionId.toString(),
                      reasonId: _currentSelectedReason.id,
                      reasonDesc: reasonDescriptionController.text,
                      onSuccess: (response) {
                        hideLoading();
                        Navigator.of(context).pop();
                        widget.onRejectSuccess(response);
                      },
                      onError: (error) {
                        hideLoading();
                        showError(error);
                      });
            } else {
              showError(S.current.pleaseSelectDeclineReason);
            }

            // validateUser();
          },
        ),
      ],
    );
  }
}
