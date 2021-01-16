import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/generated/l10n.dart';

import 'model/city.dart';

class AddressFormScreen extends StatefulWidget {
  @override
  State createState() {
    return _AddressFormScreenState();
  }
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  List<City> dropdownCityList;
  City dropdownCityValue;
  TextEditingController addressNameController = TextEditingController();
  TextEditingController addressCityController = TextEditingController();
  TextEditingController addressStreetController = TextEditingController();
  TextEditingController addressBuildingNumberController =
      TextEditingController();
  TextEditingController addressFloorNumberController = TextEditingController();
  TextEditingController addressApartmentNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    dropdownCityList = getMockCityList();
    dropdownCityValue = dropdownCityList[0];
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).addNewAddress),
          elevation: 0.0,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              color: french_blue,
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background_2.png"),
                    fit: BoxFit.cover),
                border: Border.all(
                  color: kBackgroundWhite,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.0),
                    topRight: Radius.circular(28.0))),
            child: getAddressFormView()));
  }

  Widget getAddressFormView() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height*.8,
         child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 32,),
                Container(
                  width: MediaQuery.of(context).size.width * .85,
                  height: 55,
                  alignment: Alignment.center,
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
                  child: TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    decoration: new InputDecoration(
                        errorStyle: TextStyle(height: 0),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: S.of(context).addressName,
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * .85,
                    height: 55,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 14),
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
                    child: DropdownButton<City>(
                      value: dropdownCityValue,
                      underline: Container(
                        height: 2,
                      ),
                      onChanged: (City newValue) {
                        setState(() {
                          dropdownCityValue = newValue;
                        });
                      },
                      items: dropdownCityList
                          .map<DropdownMenuItem<City>>((City value) {
                        return DropdownMenuItem<City>(
                          value: value,
                          child: Container(
                            width: MediaQuery.of(context).size.width * .7,
                            child: Text(
                              value.name,
                              style: TextStyle(color: french_blue),
                            ),
                          ),
                        );
                      }).toList(),
                    )),
                SizedBox(
                  height: 14,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .85,
                  height: 55,
                  alignment: Alignment.center,
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
                  child: TextFormField(
                    controller: addressStreetController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    decoration: new InputDecoration(
                        errorStyle: TextStyle(height: 0),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: S.of(context).addressStreet,
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .85,
                  height: 55,
                  alignment: Alignment.center,
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
                  child: TextFormField(
                    controller: addressBuildingNumberController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    decoration: new InputDecoration(
                        errorStyle: TextStyle(height: 0),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: S.of(context).addressBuildingNumber,
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .85,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                    spreadRadius: 0)
                              ],
                              color: const Color(0xffffffff)),
                          child: TextFormField(
                            controller: addressFloorNumberController,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                              errorStyle: TextStyle(height: 0),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: S.of(context).AddressFloorNumber,
                              hintStyle: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 32.0),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width * .20,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                    spreadRadius: 0)
                              ],
                              color: const Color(0xffffffff)),
                          child: TextFormField(
                            controller: addressApartmentNumberController,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: S.current.apartmentNumber),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: customActionButton(
                  width: MediaQuery.of(context).size.width * .77,
                  height: 45,
                  btnColor: boring_green,
                  textColor: Color(0xffffffff),
                  btnText:S.current.apply),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 0)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<City> getMockCityList() {
    City city = City();
    city.name = "Cairo";
    city.id = 1;
    City city2 = City();
    city2.name = "Giza";
    city2.id = 1;
    City city3 = City();
    city3.name = "Alex";
    city3.id = 1;
    City city4 = City();
    city4.name = "Fayom";
    city4.id = 1;

    return [city, city2, city3, city4];
  }
}
