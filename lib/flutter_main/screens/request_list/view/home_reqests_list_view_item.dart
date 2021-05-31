import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:intl/intl.dart';

class RequestListViewItem extends StatefulWidget {
  LabelDirection labelDirection;
  Request request;
  Function onClick;

  RequestListViewItem({this.labelDirection, this.request, this.onClick});

  @override
  State<StatefulWidget> createState() {
    return RequestListViewItemState();
  }
}

class RequestListViewItemState extends State<RequestListViewItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .11,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: widget.labelDirection != LabelDirection.MID &&
                      widget.labelDirection != LabelDirection.MID_TOP
                  ? Colors.white.withOpacity(.05000000074505806)
                  : Colors.transparent),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new AutoSizeText(parseTime(widget.request.assigneeDate),
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Color(0xffffffff),
                            )),
                    SizedBox(
                      height: 8,
                    ),
                    AutoSizeText(parseTime(widget.request.transactionDate),
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Color(0xffffffff),
                            ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: getLabelView(),
                ),
                getDescView()
              ],
            ),
          )),
      onTap: () {
        widget.onClick(widget.request);
      },
    );
  }

  getLabelView() {
    if (widget.labelDirection == LabelDirection.TOP) {
      return Container(
        width: 20,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 1,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .05),
              alignment: Alignment.center,
              color: Color(0xff61ba66),
            ),
            getDotView()
          ],
        ),
      );
    } else if (widget.labelDirection == LabelDirection.MID) {
      return Container(
        width: 20,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 1,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              color: Color(0xff61ba66),
            ),
            getDotView()
          ],
        ),
      );
    } else if (widget.labelDirection == LabelDirection.BOTTOM) {
      return Container(
        width: 20,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 1,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .064),
              alignment: Alignment.center,
              color: Color(0xff61ba66),
            ),
            getDotView()
          ],
        ),
      );
    } else if (widget.labelDirection == LabelDirection.SINGLE) {
      return Container(
        width: 20,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 1,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .064),
              alignment: Alignment.center,
              color: Colors.transparent,
            ),
            getDotView()
          ],
        ),
      );
    } else if (widget.labelDirection == LabelDirection.MID_TOP) {
      return Container(
        width: 20,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 1,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .064),
              alignment: Alignment.center,
              color: Color(0xff61ba66),
            ),
            getDotView()
          ],
        ),
      );
    }
  }

  Widget getDotView() {
    return widget.labelDirection != LabelDirection.MID
        ? Positioned(
            bottom: MediaQuery.of(context).size.height * .060,
            width: 8,
            height: 8,
            child: Container(
                width: 8,
                height: 8,
                decoration: new BoxDecoration(
                    color: Color(0xff61ba66),
                    borderRadius: BorderRadius.circular(24))))
        : widget.labelDirection == LabelDirection.MID_TOP
            ? Positioned(
                bottom: MediaQuery.of(context).size.height * .060,
                width: 16,
                height: 16,
                child: Container(
                  width: 16,
                  height: 16,
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                      color: Color(0xff3e9342),
                      borderRadius: BorderRadius.circular(24)),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: new BoxDecoration(
                        color: Color(0xff61ba66),
                        borderRadius: BorderRadius.circular(24)),
                  ),
                ))
            : Positioned(
                top: MediaQuery.of(context).size.height * .060,
                width: 16,
                height: 16,
                child: Container(
                  width: 16,
                  height: 16,
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                      color: Color(0xff3e9342),
                      borderRadius: BorderRadius.circular(24)),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: new BoxDecoration(
                        color: Color(0xff61ba66),
                        borderRadius: BorderRadius.circular(24)),
                  ),
                ));
  }

  getDescView() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Text(widget.request.customerName,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline3),
          SizedBox(
            height: 12,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height * .05,
            child: AutoSizeText(widget.request.transactionAddress,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline3.copyWith(
                      fontWeight: FontWeight.w400,
                    )),
          )
        ],
      ),
    );
  }

  String parseTime(String timeVal) {
    String datetime = timeVal;
    // String offset = data["utc_offset"].substring(1, 3);
    DateTime now = DateTime.parse(datetime);
    // now = now.add(Duration(hours: int.parse(offset)));
    return DateFormat("hh:mm ").format(now);
  }
}

enum LabelDirection { TOP, MID, BOTTOM, SINGLE, MID_TOP }
