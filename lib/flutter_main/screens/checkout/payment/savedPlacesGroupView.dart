import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class SavedPlacesGroupView extends StatefulWidget {
  Function onAddressSelected;
  Address selectedAddress;
  List<Address> addressList = [];
  int textvat;

  SavedPlacesGroupView({onAddressSelected, addressList}) {
    if (this.addressList.isEmpty) {
      this.addressList = addressList;
    }

    this.onAddressSelected = onAddressSelected;
  }

  @override
  State<StatefulWidget> createState() {
    return _SavedPlacesGroupViewState();
  }
}

class _SavedPlacesGroupViewState extends State<SavedPlacesGroupView> {
  @override
  void initState() {
    widget.textvat = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("SavedPlacesGroupView ---> build() } ");

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
    if (widget.addressList.length > 0) {
      return Column(
        children: [
          // for (Address address in widget.addressList)
          for (int i = 0; i < widget.addressList.length; i++)
            Row(
              children: [
                Radio(
                  value: widget.addressList[i],
                  groupValue:
                      widget.selectedAddress ?? widget.addressList.first,
                  onChanged: (index) {
                    setState(() {
                      widget.onAddressSelected(widget.addressList[i]);
                      widget.selectedAddress = widget.addressList[i];
                    });
                  },
                  activeColor: boring_green,
                ),
                Text(widget.addressList[i].title,
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
