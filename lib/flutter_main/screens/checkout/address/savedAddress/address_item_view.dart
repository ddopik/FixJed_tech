import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class AddressItemView extends StatelessWidget {
  final Address address;
  final Function onAddressEditClick;

  AddressItemView({this.address, this.onAddressEditClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 2.0,
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .26,
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
                              height: 8,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.location_on,
                                      color: boring_green,
                                    ),
                                    iconSize: 30,
                                    onPressed: null),
                                Text(address.title,
                                    style: const TextStyle(
                                        color: french_blue,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Tajawal",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.0),
                                    textAlign: TextAlign.start),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                    S.current.addressStreet +
                                        " : " +
                                        address.streetName,
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
                                Text(
                                    S.current.addressBuildingNumber +
                                        " : " +
                                        address.buildingNumber.toString(),
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
                                Text(
                                    S.current.apartmentNumber +
                                        " : " +
                                        address.apartmentNumber,
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
                                Text(
                                    S.current.AddressFloorNumber +
                                        " : " +
                                        address.floorNumber.toString(),
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
                              padding: EdgeInsets.only(bottom: 22, left: 8),
                              icon: Icon(
                                Icons.edit,
                                color: boring_green,
                              ),
                              iconSize: 25,
                              onPressed: () {
                                onAddressEditClick(address);
                              }),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ))
                ],
              ),
            )),
      ],
    );
  }
}
