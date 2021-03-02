import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';

import 'model/fix_jed_notification.dart';

class NotificationItemView extends StatelessWidget {
  final FixJedNotification notification;

  const NotificationItemView({this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      elevation: 2.0,
      child: Container(
        padding: EdgeInsets.all(12.0),
        width: MediaQuery.of(context).size.width * .8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(notification.title,
                style: const TextStyle(
                    color: french_blue,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Tajawal",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.start),
            Text(notification.description,
                style: const TextStyle(
                    color: const Color(0xff646363),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Tajawal",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
