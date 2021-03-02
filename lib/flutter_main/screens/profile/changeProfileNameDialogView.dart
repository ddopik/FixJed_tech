import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/app_model.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/slide_dialog.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:provider/provider.dart';

TextEditingController _firstNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();

changeProfileNameDialogView<T>(
    {@required BuildContext context,
    Color barrierColor,
    bool barrierDismissible = false,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Color pillColor,
    String message,
    Color backgroundColor,
    Function onChangeProfileClick}) {
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
                  heightRatio: 2.3,
                  pillColor: pillColor ?? Colors.blueGrey[200],
                  backgroundColor:
                      backgroundColor ?? Theme.of(context).canvasColor,
                  child: renderProfileNameForm(context, onChangeProfileClick)),
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

renderProfileNameForm(BuildContext context, Function onChangeProfileNameClick) {



  return Form(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          S.of(context).changeName,
          style: const TextStyle(
              color: french_blue,
              fontWeight: FontWeight.w700,
              fontFamily: "Raleway",
              fontStyle: FontStyle.normal,
              fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
        // Rectangle 85
        SizedBox(height: 12.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .35,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: Color(0xffe7f5e8)),
              child: TextFormField(
                enableSuggestions: false,
                controller: _firstNameController,
                keyboardType: TextInputType.visiblePassword,
                decoration: new InputDecoration(
                    errorStyle: TextStyle(height: 0),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: Provider.of<AppModel>(context).getUserFirstName(),
                    hintStyle: TextStyle(fontSize: 14)),
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .35,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: Color(0xffe7f5e8)),
              child: TextFormField(
                enableSuggestions: false,
                controller: _lastNameController,
                keyboardType: TextInputType.visiblePassword,
                decoration: new InputDecoration(
                    errorStyle: TextStyle(height: 0),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: Provider.of<AppModel>(context).getUserLastName(),
                    hintStyle: TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
        //

        SizedBox(height: 18.0),
        // Rectangle 85
        ////////////////////
        InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width * .75,
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 0)
                ],
                color: boring_green),
            child: Text(
              S.of(context).save,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          onTap: () {
            onChangeProfileNameClick(
                _firstNameController.value.text, _firstNameController.value.text);
          },
        ),
      ],
    ),
  );
}
