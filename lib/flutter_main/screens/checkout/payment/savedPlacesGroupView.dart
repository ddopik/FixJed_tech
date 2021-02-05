import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/provider/AddressProvider.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class SavedPlacesGroupView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SavedPlacesGroupViewState();
  }
}

class _SavedPlacesGroupViewState extends State<SavedPlacesGroupView> {
  AddressModel _addressModel;
  List<Address> addressList = [];

  Address _selectedAddress;

  @override
  void initState() {
    _addressModel = AddressModel();
    _addressModel.getSavedAddress(
      onSuccess: (savedAddress) {
        setState(() {
          addressList = savedAddress;
        });
      },
      onError: (error) {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("MainFeaturesListView ---> build() " + widget.category.name.toString() + "   " + widget.category.id.toString());

    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(child: getSavedPlacesRadioItems()),
          SizedBox(
            height: 10,
          )
        ]);
  }

  Widget getSavedPlacesRadioItems() {
    print("getSavedPlacesRadioItems ---->" + addressList.length.toString());
    return Column(
      children: [
        for (Address address in addressList)
          Row(
            children: [
              Radio(
                value: address,
                groupValue: _selectedAddress,
                onChanged: (index) {
                  setState(() {
                    _selectedAddress = address;
                  });
                },
                activeColor: boring_green,
              ),
              Text(address.streetName,
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
    );
  }

  gerNoAddressView() {
    return Row(
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
    );
  }
}
