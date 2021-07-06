import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class OrderSubmissionFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.close,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: french_blue,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.offline_bolt,
            color: nasty_green,
            size: 156,
          ),
          Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .06,
              child: AutoSizeText(S.current.OrderHasCompletedSuccessfully,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6))
        ]),
      ),
    );
  }
}
