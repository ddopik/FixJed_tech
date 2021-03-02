import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/slide_dialog.dart';
import 'package:flutter_base_app/generated/l10n.dart';

TextEditingController _oldPasswordController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _confirmPasswordController = TextEditingController();

changeProfilePhotoDialogView<T>(
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
                  heightRatio: 1.7,
                  pillColor: pillColor ?? Colors.blueGrey[200],
                  backgroundColor:
                      backgroundColor ?? Theme.of(context).canvasColor,
                  child: renderUploadProfilePhotoForm(
                      context, onChangePasswordClick)),
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

renderUploadProfilePhotoForm(
    BuildContext context, Function onChangePasswordClick) {
  return Form(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          S.of(context).chooseNewProfilePhoto,
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
        Divider(),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 28,
              color: boring_green,
            ),
            SizedBox(
              width: 6,
            ),
            Text(S.of(context).choosePhoto,
                style: const TextStyle(
                    color: french_blue,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Tajawal",
                    fontStyle: FontStyle.normal,
                    fontSize: 19.0)),
          ],
        ),

        SizedBox(height: 12.0),
        Divider(),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.linked_camera_rounded,
              size: 28,
              color: boring_green,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              S.of(context).CapturePhoto,
              style: const TextStyle(
                  color: french_blue,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Tajawal",
                  fontStyle: FontStyle.normal,
                  fontSize: 19.0),
            ),
          ],
        ),
        //
        SizedBox(height: 12.0),
        Divider(),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).deletePhoto,
              style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Tajawal",
                  fontStyle: FontStyle.normal,
                  fontSize: 19.0),
            ),
          ],
        ),
        //
        SizedBox(height: 12.0),
      ],
    ),
  );
}
