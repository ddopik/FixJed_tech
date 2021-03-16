import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/slide_dialog.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/address_form_screen.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';

TextEditingController _addNewPhoneTextController = TextEditingController();

addNewAddressDialogView<T>(
    {@required BuildContext context,
    Color barrierColor,
    bool barrierDismissible = false,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Color pillColor,
    String message,
    String title,
    String currentPhoneNumber,
    Color backgroundColor,
    Address address,
    Function onAddNewAddress}) {
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
      print("currentAddress ---> " + address?.title.toString());

      return GestureDetector(
        child: Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * -300, 0.0),
          child: Opacity(
            opacity: animation1.value,
            child: SingleChildScrollView(
              child: SlideDialog(
                  heightRatio: 2.9,
                  pillColor: pillColor ?? Colors.blueGrey[200],
                  backgroundColor:
                      backgroundColor ?? Theme.of(context).canvasColor,
                  child: AddressFormScreen(
                      currentAddress: address,
                      onAddNewAddress: () {
                        onAddNewAddress();
                      })),
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
