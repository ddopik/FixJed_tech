import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class SavedPlacesGroupView extends StatefulWidget {
  final Function onAddressSelected;
  final List<Address> addressList;

  SavedPlacesGroupView({Key key, this.onAddressSelected, this.addressList})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SavedPlacesGroupViewState();
  }
}

class _SavedPlacesGroupViewState extends State<SavedPlacesGroupView> {
  Address _selectedAddress;

  @override
  Widget build(BuildContext context) {
    print("SavedPlacesGroupView ---> build() ");

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
    print("getSavedPlacesRadioItems ---->" +
        widget.addressList.length.toString());
    if (widget.addressList.length > 0) {
      return Column(
        children: [
          for (Address address in widget.addressList)
            Row(
              children: [
                Radio(
                  value: address,
                  groupValue: _selectedAddress,
                  onChanged: (index) {
                    setState(() {
                      widget.onAddressSelected(address);
                      _selectedAddress = address;
                    });
                  },
                  activeColor: boring_green,
                ),
                Text(address.title,
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
    } else {
      return gerNoAddressView();
    }
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
