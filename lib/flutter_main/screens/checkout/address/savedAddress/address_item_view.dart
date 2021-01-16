import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class AddressItemView extends StatelessWidget {
  final Address address;
  AddressItemView({this.address});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 18,
        ),
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 2.0,
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .18,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.location_on,
                                      color: boring_green,
                                    ),
                                    iconSize: 20,
                                    onPressed: null),
                                Text(S.current.savedPlaces,
                                    style: const TextStyle(
                                        color: french_blue,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Tajawal",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.0),
                                    textAlign: TextAlign.left),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Text(S.current.noSavedPlaces,
                                    style: const TextStyle(
                                        color: const Color(0xff646363),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Tajawal",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.left),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.add_circle_outlined,
                                      color: boring_green,
                                    ),
                                    iconSize: 20,
                                    onPressed: null),
                                Text(S.of(context).addNewAddress,
                                    style: const TextStyle(
                                        color: const Color(0xff646363),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Tajawal",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 17.0),
                                    textAlign: TextAlign.left),
                              ],
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: boring_green,
                              ),
                              iconSize: 25,
                              onPressed: () {}),
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios_rounded,
                                  color: boring_green),
                              iconSize: 25,
                              onPressed: () {})
                        ],
                      ))
                ],
              ),
            ))
      ],
    );
  }
}
