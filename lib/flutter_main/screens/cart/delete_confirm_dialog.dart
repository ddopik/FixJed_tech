import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/generated/l10n.dart';

getDeleteConfirmDialogView(context) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
    //this right here
    child: Container(
      height: MediaQuery.of(context).size.height * .25,
      width: MediaQuery.of(context).size.width * .8,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 5,
            ),
            Text("هل تريد حذف خدمات سخان الغاز؟",
                style: const TextStyle(
                    color: french_blue,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Raleway",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.center),
            ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: // نعم
                              Text(S.of(context).yes,
                                  style: const TextStyle(
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Tajawal",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.0),
                                  textAlign: TextAlign.center),
                          decoration: BoxDecoration(color: boring_green))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(S.of(context).no,
                              style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Tajawal",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.0),
                              textAlign: TextAlign.center),
                          decoration: BoxDecoration(color: red))),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
  ;
}
