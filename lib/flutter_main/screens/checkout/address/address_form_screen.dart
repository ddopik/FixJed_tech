import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/provider/AddressProvider.dart';
import 'package:flutter_base_app/generated/l10n.dart';

import 'model/Address.dart';
import 'model/city.dart';

class AddressFormScreen extends StatefulWidget {
  final Function onAddNewAddress;
  Address currentAddress;

  AddressFormScreen({Key key, this.onAddNewAddress, this.currentAddress});

  @override
  State createState() {
    return _AddressFormScreenState();
  }
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  AddressModel _addressModel;

  List<City> dropdownCityList;
  List<City> dropdownCityRegionList;
  City _selectedDropdownCityValue;
  City _selectedDropdownRegionValue;

  TextEditingController addressNameController = TextEditingController();
  TextEditingController addressCityController = TextEditingController();
  TextEditingController addressStreetController = TextEditingController();
  TextEditingController addressBuildingNumberController =
      TextEditingController();
  TextEditingController addressFloorNumberController = TextEditingController();
  TextEditingController addressApartmentNumberController =
      TextEditingController();

  @override
  void initState() {
    _addressModel = AddressModel();
    dropdownCityList = getCitiesList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getAddressFormView();
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).addNewAddress),
          elevation: 0.0,
          centerTitle: true,
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
        height: MediaQuery.of(context).size.height * .8,
        child: Column(
          children: [
            SizedBox(
              height: 32,
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
                cursorColor: Colors.black,
                keyboardType: TextInputType.name,
                controller: addressNameController,
                decoration: new InputDecoration(
                    errorStyle: TextStyle(height: 0),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: (widget.currentAddress != null)
                        ? widget.currentAddress.title
                        : S.of(context).addressName,
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
                  value: dropdownCityList?.first,
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (City newValue) {
                    setState(() {
                      _selectedDropdownCityValue = newValue;
                    });
                  },
                  items: dropdownCityList
                      ?.map<DropdownMenuItem<City>>((City value) {
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
                  })?.toList(),
                )),
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
                  value: dropdownCityRegionList?.singleWhere(
                      (element) => element.id == widget.currentAddress?.id,
                      orElse: () {
                    return dropdownCityRegionList?.first;
                  }),
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (City newValue) {
                    setState(() {
                      _selectedDropdownRegionValue = newValue;
                    });
                  },
                  items: dropdownCityRegionList
                      ?.map<DropdownMenuItem<City>>((City value) {
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
                  })?.toList(),
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
                    hintText: widget.currentAddress?.streetName ??
                        S.of(context).addressStreet,
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
                    hintText: widget.currentAddress?.buildingNumber ??
                        S.of(context).addressBuildingNumber,
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
                          borderRadius: BorderRadius.all(Radius.circular(24)),
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
                          hintText: widget.currentAddress?.floorNumber ??
                              S.of(context).AddressFloorNumber,
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
                          borderRadius: BorderRadius.all(Radius.circular(24)),
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
                            hintText: widget.currentAddress?.apartmentNumber ??
                                S.current.apartmentNumber),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 14.0),
            Container(
                width: MediaQuery.of(context).size.width * .85,
                height: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: boring_green, width: 0.5),
                    color: const Color(0xffe7f5e8))),
            SizedBox(height: 14.0),
            Container(
              child: customActionButton(
                  width: MediaQuery.of(context).size.width * .85,
                  height: 45,
                  btnColor: boring_green,
                  textColor: Color(0xffffffff),
                  btnText: S.current.apply,
                  onPressed: () {
                    if (widget.currentAddress != null) {
                      updateNewAddress();
                    } else {
                      submitNewAddress();
                    }
                  }),
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

  getCitiesList() {
    _addressModel.getCities(onSuccess: (cityList) {
      dropdownCityList = cityList;

      print("getCitiesList --->" + cityList.toString());
      print("_selectedDropdownRegionValue --->" +
          _selectedDropdownRegionValue?.id.toString());
      getCitiesRegionList(
          _selectedDropdownRegionValue?.id ?? dropdownCityList?.first);
    });
  }

  getCitiesRegionList(City city) {
    _addressModel.getCitiesRegion(
        cityId: city.id,
        onSuccess: (cityList) {
          setState(() {
            dropdownCityRegionList = cityList;
          });
        },
        onError: (error) {
          setState(() {});
        });
  }

  submitNewAddress() {
    _addressModel.submitNewAddress(
        title: addressNameController.value.text,
        streetName: addressStreetController.value.text,
        cityId: _selectedDropdownCityValue?.id ?? dropdownCityList[0].id,
        floor: addressFloorNumberController.value.text,
        apartmentNumber: addressApartmentNumberController.value.text,
        buildingNumber: addressBuildingNumberController.value.text,
        onSuccess: (response) {
          showSuccesses(context, S.current.addressCreatedSuccessfully);
          Navigator.of(context).pop();
        },
        onError: (errorResponse) {
          showError(S.current.applicationError);
        });
  }

  updateNewAddress() {
    if (addressNameController.value.text == null) {
      print("addressNameController ---> is null");
    }
    _addressModel.editAddress(
        id: widget.currentAddress.id,
        title: addressNameController.value.text.isNotEmpty
            ? addressNameController.value.text
            : widget.currentAddress.title,
        streetName: addressStreetController.value.text.isNotEmpty
            ? addressStreetController.value.text
            : widget.currentAddress.streetName,
        cityId: (_selectedDropdownCityValue != null)
            ? _selectedDropdownRegionValue.id
            : dropdownCityRegionList?.first?.id ?? 0,
        floor: addressFloorNumberController.value.text.isNotEmpty
            ? addressFloorNumberController.value.text
            : widget.currentAddress.floorNumber.toString(),
        apartmentNumber: addressApartmentNumberController.value.text.isNotEmpty
            ? addressApartmentNumberController.value.text
            : widget.currentAddress.apartmentNumber.toString(),
        buildingNumber: addressBuildingNumberController.value.text.isNotEmpty
            ? addressBuildingNumberController.value.text
            : widget.currentAddress.buildingNumber,
        onSuccess: (response) {
          showSuccesses(context, S.current.addressUpdatedSuccessfully);
          widget.onAddNewAddress();
        },
        onError: (errorResponse) {
          showError(errorResponse);
        });
  }
}
