import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/error_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/exception_indicators/no_connection_indicator.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/CircleImageWidget.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/app_bar_back_button.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:flutter_base_app/flutter_main/screens/request_screen/provider/RequestCarfdProvider.dart';
import 'package:flutter_base_app/generated/l10n.dart';

import 'call_operator_slide_dialog_view.dart';

class TransactionCardScreen extends StatefulWidget {
  final arguments;

  TransactionCardScreen({this.arguments});

  @override
  State<StatefulWidget> createState() {
    return TransactionCardScreenState();
  }
}

class TransactionCardScreenState extends State<TransactionCardScreen> {
  final requestCardProvider = RequestCardProvider();
  Transaction _request;
  bool _isLoading = true;
  bool _showErrorState = false;
  var _currentMainError = '';

  @override
  void initState() {
    getRequestInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: AppBarBackButton(),
        elevation: 0.0,
      ),
      body: _getView(),
    );
  }

  Widget _getView() {
    if (_isLoading) return Container();
    if (_showErrorState) return getErrorView();

    return Container(
      padding: EdgeInsets.only(
          left: inner_boundary_field_space_wide,
          right: inner_boundary_field_space_wide,
          bottom: inner_boundary_field_space_wide),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(inner_boundary_field_space_wide),
            child: Text(
                parseTimeToMonthDate(_request.transactionDate), // current date
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Color(0xffffffff),
                    )),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .30,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white.withOpacity(.05000000074505806)),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            getProfileImage(),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            CircleImageWidget(
                              url: _request?.categoryUrl ?? "",
                              fit: BoxFit.contain,
                              width: MediaQuery.of(context).size.width * .095,
                              height: MediaQuery.of(context).size.width * .095,
                              borderColor: Colors.white,
                              borderWidth: 2,
                            )
                          ],
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.call,
                              size: 34,
                              color: Color(0xff61ba66),
                            ),
                            onPressed: () {})
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Text(parseTimeToHour(_request.transactionDate),
                                // set hour here
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Color(0xffffffff),
                                    )),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  new Text(_request?.customerName ?? "",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .58,
                                    height: MediaQuery.of(context).size.height *
                                        .16,
                                    child: AutoSizeText(
                                        _request?.transactionAddress ?? "",
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3
                                            .copyWith(
                                              fontWeight: FontWeight.w400,
                                            )),
                                  ),
                                  new Text(_request?.customerPhone ?? "",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xffffffff),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(height: 32),
          getRequestButton()
        ],
      ),
    );
  }

  getProfileImage() {
    return Container(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CircleImageWidget(
            url: _request?.customerImageUrl ?? default_profile_img,
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width * .14,
            height: MediaQuery.of(context).size.width * .14,
            borderColor: Colors.white,
            borderWidth: 2,
          ),
          Container(
            width: 6,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                24,
              ),
              color: Color(0xff61ba66),
            ),
          )
        ],
      ),
    );
  }

  getRequestButton() {
    print(
        "getRequestButton ---> " + _request.technicianTransactionId.toString());
    return Column(
      children: [
        _request.startButtonActive == true && _request.startDate == null
            ? customActionButton(
                btnText: Text(
                  S.current.startRequest,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white, fontSize: text_size_1),
                ),
            width: MediaQuery.of(context).size.width * .9,
            btnColor: Color(0xff61ba66),
            btnRadius: 7.0,
            onPressed: () {
                  RequestCardProvider().acceptTransaction(
                      id: widget.arguments.technicianTransactionId.toString(),
                      onSuccess: () async {
                        await Navigator.of(context)
                            .pushNamed(Routes.COUNTER_SCREEN);
                        Navigator.of(context).pop();
                      },
                      onError: (error) {
                        showError(error);
                      });
                })
            : Container(),
        SizedBox(
          height: list_separator_space,
        ),
        _request?.cancelButtonActive == true && _request.startDate == null
            ? customActionButton(
            btnText: Text(
              S.current.cancelRequest,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white, fontSize: text_size_1),
            ),
            width: MediaQuery.of(context).size.width * .9,
            btnColor: Color(0xfff41a1a),
            btnRadius: 7.0,
            onPressed: () {
                  RequestCardProvider().cancelTransaction(
                      id: widget.arguments.technicianTransactionId.toString(),
                      onSuccess: () {
                        Navigator.of(context).pop();
                      },
                      onError: (error) {
                        showError(error);
                      });
                })
            : Container(),
        _request?.startButtonActive == false &&
                _request?.cancelButtonActive == false &&
                _request.startDate == null
            ? customActionButton(
                btnText: Text(
                  S.current.connectOperator,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white, fontSize: text_size_1),
                ),
                width: MediaQuery.of(context).size.width * .9,
                btnColor: Color(0xFFF49D1A),
                btnRadius: 7.0,
            onPressed: () {
              callOperatorDialogView(
                  context: context,
                  barrierColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  pillColor: Colors.transparent);
            })
            : Container()
      ],
    );
  }

  getRequestInfo() {
    showLoading(context);
    requestCardProvider.getRequestInfo(
        id: widget.arguments.technicianTransactionId.toString(),
        onSuccess: (request) {
          hideLoading();
          _isLoading = false;
          _showErrorState = false;
          print("getRequests ----> " + request.toString());
          _request = request;
          if (_request.startButtonActive == true &&
              _request.startDate != null) {
            Navigator.of(context).pushReplacementNamed(Routes.COUNTER_SCREEN);
          }
          setState(() {});
        },
        onError: (error) {
          _currentMainError = error;
          hideLoading();
          _isLoading = false;
          _showErrorState = true;
          setState(() {});
        });
  }

  Widget getErrorView() {
    if (_currentMainError == "Connection failed") {
      return NoConnectionIndicator(onTryAgain: () {
        getRequestInfo();
      });
    } else {
      return ErrorIndicator(
        error: _currentMainError,
        onTryAgain: () {
          getRequestInfo();
        },
      );
    }
  }
}
