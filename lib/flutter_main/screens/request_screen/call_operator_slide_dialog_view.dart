import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/slide_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

callOperatorDialogView<T>(
    {@required BuildContext context,
    Color barrierColor,
    bool barrierDismissible = false,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Color pillColor,
    String message,
    Color backgroundColor,
    Function onChangePasswordClick}) {
  assert(context != null);

  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation1, animation2) {},
    barrierColor: barrierColor ?? Colors.black.withOpacity(0.7),
    barrierDismissible: true,
    barrierLabel: "Dismiss",
    transitionDuration: transitionDuration,
    transitionBuilder: (context, animation1, animation2, widget) {
      final curvedValue = Curves.easeInOut.transform(animation1.value) - 1.0;
      return GestureDetector(
        child: Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * -300, 0.0),
          child: Opacity(
            opacity: animation1.value,
            child: SingleChildScrollView(
              child: SlideDialog(
                  heightRatio: 1.25,
                  pillColor: pillColor ?? Colors.blueGrey[200],
                  backgroundColor:
                      backgroundColor ?? Theme.of(context).canvasColor,
                  child: renderView(context, onChangePasswordClick)),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
        },
      );
    },
  );
}

renderView(BuildContext context, Function onChangePasswordClick) {
  return Container(
    child: Column(
      children: [
        getRequestButton_1(context),
        SizedBox(
          height: 12,
        ),
        getRequestButton_2(context),
      ],
    ),
  );
}

getRequestButton_1(context) {
  return customActionButton(
      btnText: Text(
        "Call 0123243234",
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: Color(0xff61ba66)),
      ),
      width: MediaQuery.of(context).size.width * .9,
      btnColor: Color(0xffe7f5e8),
      btnRadius: 7.0,
      onPressed: () {
        launch("tel://0123243234");
      });
}

getRequestButton_2(context) {
  return customActionButton(
    btnText: Text(
      "Cancel",
      style: Theme.of(context)
          .textTheme
          .headline6
          .copyWith(color: Color(0xffdd0807), fontSize: 20),
    ),
    width: MediaQuery.of(context).size.width * .9,
    btnColor: Colors.white,
    btnRadius: 7.0,
  );
}
