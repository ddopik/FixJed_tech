import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/fix_jed_notification.dart';

class NotificationItemView extends StatelessWidget {
  final FixJedNotification notification;

  const NotificationItemView({this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.0),
      width: MediaQuery.of(context).size.width * .8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(.05000000074505806)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          Text(notification.subject,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Tajawal",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
              textAlign: TextAlign.start),
          Text(notification.content,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Tajawal",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0)),
          SizedBox(
            height: 16,
          ),
          Text(
            DateFormat.yMMMMd()
                .format(DateTime.parse(notification.createdDate)),
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Tajawal",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
