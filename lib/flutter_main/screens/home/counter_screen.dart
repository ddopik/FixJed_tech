import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class CounterScreen extends StatefulWidget {
  final arguments;

  CounterScreen({this.arguments});

  @override
  State<StatefulWidget> createState() {
    return CounterScreenState();
  }
}

class CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter, color: french_blue, child: _getView());
  }

  Widget _getView() {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .20),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/images/loading_gif.gif"),
          SizedBox(
            height: inner_boundary_field_space,
          ),
          getActionButton()
        ],
      ),
    );
  }

  getActionButton() {
    return Column(
      children: [
        customActionButton(
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
              //todo move to cancel Reasons screen
              // Navigator.of(context).pop();
            }),
        SizedBox(
          height: list_separator_space,
        ),
        customActionButton(
            btnText: Text(
              S.current.endRequest,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white, fontSize: text_size_1),
            ),
            width: MediaQuery.of(context).size.width * .9,
            btnColor: Color(0xff61ba66),
            btnRadius: 7.0,
            onPressed: () {
              Navigator.pushNamed(context, Routes.TRANSACTION_SUBMIT_SCREEN,
                  arguments: widget.arguments);
            }),
      ],
    );
  }
}
