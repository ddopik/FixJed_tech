import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/generated/l10n.dart';

addPhotoSlideDialog<T>(
    {@required BuildContext context,
    Color barrierColor,
    bool barrierDismissible = false,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Color pillColor,
    String message,
    Color backgroundColor,
    Function onChoosePhotoClick,
    Function onChooseGalleryClick}) {
  assert(context != null);

  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: 250,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              renderView(context, onChoosePhotoClick, onChooseGalleryClick),
            ],
          ),
        ),
      );
    },
  );
}

renderView(BuildContext context, Function onChoosePhotoClick,
    Function onChooseGalleryClick) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.all(24),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * .150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Color(0xbfffffff),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: getRequestButton_1(context),
              onTap: () {
                onChoosePhotoClick();
              },
            ),
            SizedBox(
              height: 18,
            ),
            GestureDetector(
              child: getRequestButton_2(context),
              onTap: () {
                onChooseGalleryClick();
              },
            ),
          ],
        ),
      ),
      customActionButton(
          btnText: Text(
            S.current.cancel,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: red, fontSize: text_head_size_1),
          ),
          width: MediaQuery.of(context).size.width * .91,
          height: MediaQuery.of(context).size.height * .066,
          btnColor: Colors.white,
          btnRadius: 8.0,
          onPressed: () {
            // RequestCardProvider().acceptTransaction(
            //     id: widget.arguments.technicianTransactionId.toString(),
            //     onSuccess: () {
            //       showSuccesses(context, S.current.success);
            //     },
            //     onError: (error) {
            //       showError(error);
            //     });
          }),
      SizedBox(
        height: MediaQuery.of(context).size.height * .008,
      ),
    ],
  );
}

getRequestButton_1(context) {
  return Container(
    child: Row(
      children: [
        Icon(
          Icons.image_outlined,
          color: boring_green,
        ),
        SizedBox(
          width: outer_boundary_field_space,
        ),
        new Text("Camera",
            style: TextStyle(
              fontFamily: 'Roboto',
              color: french_blue,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.38,
            ))
      ],
    ),
  );
}

getRequestButton_2(context) {
  return Container(
    child: Row(
      children: [
        Icon(
          Icons.camera_enhance,
          color: boring_green,
        ),
        SizedBox(
          width: outer_boundary_field_space,
        ),
        new Text("Photos",
            style: TextStyle(
              fontFamily: 'Roboto',
              color: french_blue,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.38,
            ))
      ],
    ),
  );
}
