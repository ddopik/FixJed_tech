import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/address/provider/AddressProvider.dart';
import 'package:flutter_base_app/flutter_main/screens/checkout/payment/savedPlacesGroupView.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class PaymentScreen extends StatefulWidget {
  Address currentSelectedAddress;
  AddressModel addressModel;
  List<Address> addressList = [];


  @override
  State<StatefulWidget> createState() {
    return _PaymentScreenState();
  }
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _totalPrice=0;
  @override
  void initState() {
    widget.addressModel = AddressModel();
    getSavedAddress();
    super.initState();
  }

  getSavedAddress() {
    widget.addressModel.getSavedAddress(
      onSuccess: (savedAddress) {
        setState(() {
          widget.addressList = savedAddress;
          print("getSavedAddress ---> called() with" +
              widget.addressList.length.toString());
        });
      },
      onError: (error) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    _totalPrice = ModalRoute.of(context).settings.arguments??0;
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).payment),
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
          child: SingleChildScrollView(child: getPaymentView()),
        ));
  }

  Widget getPaymentView() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              getPaymentAddressView(),
              getPaymentMethodsView(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // إجمالي
                  Text(S.current.total,
                      style: const TextStyle(
                          color: french_blue,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Tajawal",
                          fontStyle: FontStyle.normal,
                          fontSize: 22.0),
                      textAlign: TextAlign.left),
                  // 350 جنيه مصري
                  Text(_totalPrice.toString() + " " + S.current.egp,
                      style: const TextStyle(
                          color: const Color(0xff5cb06d),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Futura",
                          fontStyle: FontStyle.normal,
                          fontSize: 16),
                      textAlign: TextAlign.left)
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: customActionButton(
                    width: MediaQuery.of(context).size.width * .77,
                    height: 48,
                    btnColor: boring_green,
                    textColor: Color(0xffffffff),
                    fontSize: 18,
                    btnText: S.current.createRequest),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        spreadRadius: 0)
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getPaymentAddressView() {
    return Column(
      children: [
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 2.0,
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.location_on,
                                      color: boring_green,
                                    ),
                                    iconSize: 30,
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
                            IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: boring_green,
                                ),
                                iconSize: 25,
                                onPressed: () async {
                                  Navigator.of(context)
                                      .pushNamed(Routes.ADDRESS_LIST_SCREEN)
                                      .then((value) {
                                    setState(() {
                                      getSavedAddress();
                                    });
                                  });
                                })
                          ],
                        ),
                        SavedPlacesGroupView(
                            addressList: widget.addressList,
                            onAddressSelected: (address) {
                              widget.currentSelectedAddress = address;
                            }),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Row(
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.add_circle_outlined,
                                        color: boring_green,
                                      ),
                                      iconSize: 30,
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
                              ),
                              onTap: () async {
                                await Navigator.of(context)
                                    .pushNamed(Routes.ADDRESS_FORM_SCREEN);
                                setState(() {
                                  getSavedAddress();
                                });
                              },
                            ),
                            IconButton(
                                icon: Icon(Icons.arrow_back_ios_rounded,
                                    color: boring_green),
                                iconSize: 25,
                                onPressed: () async {
                                  await Navigator.of(context)
                                      .pushNamed(Routes.ADDRESS_FORM_SCREEN);
                                  setState(() {
                                    getSavedAddress();
                                  });
                                })
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

  Widget getPaymentMethodsView() {
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
