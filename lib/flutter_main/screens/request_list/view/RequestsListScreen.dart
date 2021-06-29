import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/app_bar_back_button.dart';

import 'RequestsListView.dart';

class RequestsListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RequestsListScreenState();
  }
}

class RequestsListScreenState extends State<RequestsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: AppBarBackButton(),
        leadingWidth: 200,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Image.asset("assets/images/ic_history.png"),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: RequestsListView(),
      ),
    );
  }
}
