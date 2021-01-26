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
              height: MediaQuery.of(context).size.height * .20,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(

                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.location_on,
                                      color: boring_green,
                                    ),
                                    iconSize: 20,
                                    onPressed: null),
                                Text("Address Name",
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
                                  width: 20,
                                ),
                                Text("Street name",
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
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Builder number",
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
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Appartment Number",
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
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Floor Number",
                                    style: const TextStyle(
                                        color: const Color(0xff646363),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Tajawal",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.left),
                              ],
                            ),
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
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ))
                ],
              ),
            ))
      ],
    );
  }
}
