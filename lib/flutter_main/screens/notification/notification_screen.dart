import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/app_bar_back_button.dart';
import 'package:flutter_base_app/flutter_main/screens/notification/notification_list_view.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationScreenState();
  }
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: AppBarBackButton(),
        leadingWidth: 200,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(inner_boundary_field_space),
              child: Text("NOTIFICATIONS",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xffffffff),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .80,
              child: NotificationListView(),
            )
          ],
        ),
      ),
    );
  }
}
