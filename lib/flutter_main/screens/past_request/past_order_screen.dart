import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/CircleImageWidget.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/app_bar_back_button.dart';
import 'package:flutter_base_app/flutter_main/screens/past_request/past_order_list_view.dart';
import 'package:flutter_base_app/flutter_main/screens/request_list/model/request.dart';

class PastOrderScreen extends StatefulWidget {
  @override
  _PastOrderScreenState createState() => _PastOrderScreenState();
}

class _PastOrderScreenState extends State<PastOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 200,
          leading: AppBarBackButton(),
          elevation: 0.0,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: PastOrderListView()));
  }
}
