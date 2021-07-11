import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/app_bar_back_button.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/flutter_main/screens/order_submit_screen/submit_order_confirm_dialof.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/provider/TransactionModel.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'add_photo_slide_dialog.dart';

class TransactionSubmitScreen extends StatefulWidget {
  final arguments;
  DateTime elsabiTime;
  String currentElsabedinHour;
  String currentElsabedinMinutes;

  TransactionSubmitScreen({this.arguments});

  @override
  State<StatefulWidget> createState() {
    var reDate = (arguments as Transaction).startDate;
    DateTime startDate = DateTime.parse(reDate);
    DateTime dateNow = new DateTime.now();
    elsabiTime =
        dateNow.subtract(Duration(microseconds: startDate.microsecond));

    currentElsabedinHour =
        diffInHours(dateNow, startDate).toString() + " " + S.current.hour;

    currentElsabedinMinutes = elsabiTime.toString().split(":")[1].toString() +
        " " +
        S.current.minutes;

    return _OrderSubmitScreen();
  }

  int diffInHours(DateTime date1, DateTime date2) {
    return ((date1.difference(date2) -
            Duration(hours: date1.hour) +
            Duration(hours: date2.hour))
        .inHours);
  }
}

class _OrderSubmitScreen extends State<TransactionSubmitScreen> {
  final ImagePicker _picker = ImagePicker();
  List<File> _petImagePathList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: AppBarBackButton(),
        leadingWidth: 200,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(inner_boundary_field_space),
        child: SingleChildScrollView(
          child: getView(),
        ),
      ),
    );
  }

  getView() {
    return Container(
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height * .85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.current.submitOrder,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontSize: text_head_size_2),
                ),
                InkWell(
                  child: Container(
                      width: 36,
                      height: 36,
                      child: Icon(
                        Icons.add_photo_alternate_rounded,
                        color: boring_green,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: new BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(24))),
                  onTap: () {
                    if (_petImagePathList.length < 3) {
                      addPhotoSlideDialog(
                          context: context,
                          onChoosePhotoClick: () async {
                            final pickedFile = await _picker.getImage(
                                source: ImageSource.camera,
                                maxHeight: 200,
                                maxWidth: 200);
                            Navigator.of(context).pop();
                            setState(() {
                              _petImagePathList.add(File(pickedFile.path));
                            });
                          },
                          onChooseGalleryClick: () async {
                            final pickedFile = await _picker.getImage(
                                source: ImageSource.gallery,
                                maxHeight: 200,
                                maxWidth: 200);
                            Navigator.of(context).pop();
                            setState(() {
                              _petImagePathList.add(File(pickedFile.path));
                            });
                          });
                    }
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Text(S.current.comment,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 14, color: Color(0xffffffff))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                new Container(
                    width: MediaQuery.of(context).size.width * 8,
                    height: MediaQuery.of(context).size.height * .35,
                    decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(11))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
              ],
            ),
            _petImagePathList.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width * .9,
                    child: Wrap(
                        alignment: WrapAlignment.start,
                        children: _petImagePathList
                            .map((e) => Container(
                                  width:
                                      MediaQuery.of(context).size.width * .24,
                                  height:
                                      MediaQuery.of(context).size.width * .24,
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              .030),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff7c94b6),
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(
                                            (MediaQuery.of(context).size.width *
                                                    .24) /
                                                2)),
                                    border: new Border.all(
                                      color: Colors.white,
                                      width: 4.0,
                                    ),
                                  ),
                                  child: ClipOval(
                                      child: Image.file(
                                    e,
                                    fit: BoxFit.cover,
                                  )),
                                ))
                            .toList()),
                  )
                : Container(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(S.current.requestTime,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xffffffff),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )),
                new Text(
                    widget.currentElsabedinHour.toString() +
                        " " +
                        widget.currentElsabedinMinutes.toString(),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xffffffff),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Text(S.current.total,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xffffffff),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )),
                new Text(
                    widget.arguments.totalCost.toString() ??
                        " 0 " + S.current.egp,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xffffffff),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ))
              ],
            ),
            customActionButton(
                btnText: Text(
                  S.current.submitOrder,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white, fontSize: text_size_1),
                ),
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .065,
                btnColor: Color(0xff61ba66),
                btnRadius: 8.0,
                onPressed: () {
                  submitOrderConfirmDialog(context, widget.arguments,
                      onTransactionConfirmClick: () {
                    Provider.of<TransactionModel>(context, listen: false)
                        .endRequest(
                            id: widget.arguments.technicianTransactionId
                                .toString(),
                            onSuccess: () {
                              hideLoading();
                              showSuccesses(context, S.current.success);
                              Navigator.pushNamedAndRemoveUntil(
                                  context, Routes.HOME, (route) => false);
                            },
                            onError: (error) {
                              hideLoading();
                              showError(error);
                            });
                  });
                })
          ],
        ));
  }
}
