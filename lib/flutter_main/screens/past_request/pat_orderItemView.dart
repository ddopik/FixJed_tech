import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/CircleImageWidget.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/app_bar_back_button.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';
import 'package:intl/intl.dart';

class PastOrderItemView extends StatefulWidget {
  final Transaction request;

  PastOrderItemView({this.request});

  @override
  _PastOrderItemViewState createState() => _PastOrderItemViewState();
}

class _PastOrderItemViewState extends State<PastOrderItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * .85,
        height: MediaQuery.of(context).size.height * .30,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.white.withOpacity(.05000000074505806)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // color: Colors.yellow,
              width: MediaQuery.of(context).size.width * .2,
              alignment: Alignment.center,
              child: Column(children: [
                SizedBox(
                  height: 12,
                ),
                getProfileImage(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                CircleImageWidget(
                  url: widget.request?.categoryUrl ?? "",
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * .1,
                  height: MediaQuery.of(context).size.width * .1,
                  borderColor: Colors.white,
                  borderWidth: 2,
                )
              ]),
            ),
            Container(
              // color: Colors.grey,
              width: MediaQuery.of(context).size.width * .61,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .55,
                      height: MediaQuery.of(context).size.height * .0225,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            widget.request?.customerName ?? "No NAME",
                          ),
                          Row(
                            children: [
                              AutoSizeText(
                                widget.request?.technicianStatus == "DELIVERED"
                                    ? "completed"
                                    : "cancelled",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.circle,
                                size: 15,
                                color: widget.request?.technicianStatus ==
                                        "DELIVERED"
                                    ? Colors.green
                                    : Colors.red,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        width: MediaQuery.of(context).size.width * .55,
                        height: MediaQuery.of(context).size.height * .045,
                        child: AutoSizeText(
                          widget.request?.transactionAddress ?? "",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w100),
                          maxLines: 2,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .27,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText("date",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100)),
                          SizedBox(
                            width: 6,
                          ),
                          AutoSizeText(
                              parseTime(widget.request?.assigneeDate ?? ""),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                    color: Colors.white,
                                  )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    widget.request?.technicianStatus == "DELIVERED"
                        ? Container(
                            // width: MediaQuery.of(context).size.width * .2,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText("from",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100)),
                                SizedBox(
                                  width: 6,
                                ),
                                AutoSizeText(parseTimeMin(
                                    widget.request?.startDate ??
                                        "2021-07-08T06:00:00.000+00:00")),
                                SizedBox(
                                  width: 6,
                                ),
                                AutoSizeText("to",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100)),
                                SizedBox(
                                  width: 6,
                                ),
                                AutoSizeText(parseTimeMin(
                                    widget.request?.endDate ??
                                        "2021-07-08T06:00:00.000+00:00")),
                              ],
                            ),
                          )
                        : Container(
                            // width: MediaQuery.of(context).size.width * .2,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText("time",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100)),
                                SizedBox(
                                  width: 6,
                                ),
                                AutoSizeText(parseTimeMin(
                                    widget.request?.startDate ??
                                        "2021-07-08T06:00:00.000+00:00")),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      widget.request?.categoryJobType ?? "service name",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    widget.request?.technicianStatus == "DELIVERED"
                        ? Container(
                            width: MediaQuery.of(context).size.width * .3,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star_rate_sharp,
                                      size: 25,
                                      color: 1 <=
                                              (widget.request?.ratingNumber ??
                                                  0)
                                          ? Colors.yellow
                                          : Colors.black,
                                    ),
                                    Icon(Icons.star_rate_sharp,
                                        size: 25,
                                        color: 2 <=
                                                (widget.request?.ratingNumber ??
                                                    0)
                                            ? Colors.yellow
                                            : Colors.black),
                                    Icon(Icons.star_rate_sharp,
                                        size: 25,
                                        color: 3 <=
                                                (widget.request?.ratingNumber ??
                                                    0)
                                            ? Colors.yellow
                                            : Colors.black),
                                    Icon(Icons.star_rate_sharp,
                                        size: 25,
                                        color: 4 <=
                                                (widget.request?.ratingNumber ??
                                                    0)
                                            ? Colors.yellow
                                            : Colors.black),
                                    Icon(Icons.star_rate_sharp,
                                        size: 25,
                                        color: 5 <=
                                                (widget.request?.ratingNumber ??
                                                    0)
                                            ? Colors.yellow
                                            : Colors.black),
                                  ],
                                ),
                                AutoSizeText(
                                  "${widget.request?.totalCost ?? 0}\$",
                                )
                              ],
                            ))
                        : Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * .6,
                            height: 30,
                            child: AutoSizeText("cancellation reason"),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: AutoSizeText(
                        "REPORT A PROBLEM",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: nasty_green),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  getProfileImage() {
    return Container(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CircleImageWidget(
            url: widget.request?.customerImageUrl ?? default_profile_img,
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width * .16,
            height: MediaQuery.of(context).size.width * .16,
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

  String parseTime(String timeVal) {
    String datetime = timeVal;
    // String offset = data["utc_offset"].substring(1, 3);
    DateTime now = DateTime.parse(datetime);
    // now = now.add(Duration(hours: int.parse(offset)));
    return DateFormat("yyyy-MM-dd").format(now);
  }

  String parseTimeMin(String timeVal) {
    String datetime = timeVal;
    // String offset = data["utc_offset"].substring(1, 3);
    DateTime now = DateTime.parse(datetime);
    // now = now.add(Duration(hours: int.parse(offset)));
    return DateFormat("hh:mm").format(now);
  }
}
