import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class ConfirmDialogView extends StatelessWidget {
  final Address transActionAddress;

  ConfirmDialogView({this.transActionAddress});

  @override
  Widget build(BuildContext context) {
    return renderView(context);
  }

  renderView(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 6),
          child: Text(S.current.confirm,
              style: const TextStyle(
                  color: french_blue,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Tajawal",
                  fontStyle: FontStyle.normal,
                  fontSize: 24.0),
              textAlign: TextAlign.left),
        ),
        Column(
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
                                    Text(transActionAddress.title,
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
                                            transActionAddress.streetName,
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
                                            transActionAddress.buildingNumber
                                                .toString(),
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
                                            transActionAddress.apartmentNumber,
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
                                            transActionAddress.floorNumber
                                                .toString(),
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
                                    // onAddressEditClick(address);
                                  }),
                              SizedBox(
                                height: 50,
                              )
                            ],
                          )),
                    ],
                  ),
                )),
          ],
        ),
        getPaymentMethodsView(context),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 34),
          child: // إجمالي
              Text(S.of(context).phoneNumber,
                  style: const TextStyle(
                      color: french_blue,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Tajawal",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.left),
          alignment: Alignment.centerRight,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .85,
          height: 55,
          padding: EdgeInsets.symmetric(horizontal: 22),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(26)),
              boxShadow: [
                BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    spreadRadius: 0)
              ],
              color: const Color(0xffffffff)),
          child: Text(
            "0111231231223",
            style: TextStyle(
              color: french_blue,
              fontWeight: FontWeight.w400,
              fontFamily: "Tajawal",
              fontStyle: FontStyle.normal,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          color: boring_green,
          child: customActionButton(
              width: MediaQuery.of(context).size.width * 1,
              height: 48,
              btnColor: boring_green,
              textColor: Color(0xffffffff),
              fontSize: 18,
              btnText: S.current.createRequest,
              onPressed: () {
                // submitTransaction();
              }),
        ),
      ],
    ));
  }

  Widget getPaymentMethodsView(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 14,
        ),
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 2.0,
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .15,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
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
                                  Icons.payment,
                                  color: boring_green,
                                ),
                                iconSize: 25,
                                onPressed: null),
                            Text(S.of(context).paymentMethod,
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
                            Radio(
                              value: 0,
                              groupValue: 0,
                              onChanged: (index) {},
                              activeColor: boring_green,
                            ),
                            Text(S.of(context).payOnDelivery,
                                style: const TextStyle(
                                    color: const Color(0xff646363),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Tajawal",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 17.0),
                                textAlign: TextAlign.left),
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ))
      ],
    );
  }
}
