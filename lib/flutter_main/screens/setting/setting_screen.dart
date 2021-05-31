import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/app_model.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingScreen();
  }
}

class _SettingScreen extends State<SettingScreen> {
  List<Country> dropdownCityList = [
    Country(S.current.arabic, "", "ar"),
    Country(S.current.english, "", "en")
  ];
  Country _selectedDropdownCityValue;

  @override
  void initState() {
    var appModel = Provider.of<AppModel>(context, listen: false);
    setState(() {
      if (appModel.local.languageCode == "ar") {
        _selectedDropdownCityValue = Country("Egypt", "", "ar");
      } else {
        _selectedDropdownCityValue = Country("Us", "", "en");
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: getMainView(),
    );
  }

  getMainView() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(inner_boundary_field_space_wide),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(S.current.language,
              style: const TextStyle(
                  color: french_blue,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Tajawal",
                  fontStyle: FontStyle.normal,
                  fontSize: 21.3),
              textAlign: TextAlign.left),
          Container(
            width: 225,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(16)),
            child: DropdownButton<Country>(
              value: dropdownCityList?.singleWhere((element) =>
                      element.localCode ==
                      _selectedDropdownCityValue?.localCode) ??
                  dropdownCityList.first,
              underline: Container(
                height: 2,
              ),
              onChanged: (Country newValue) {
                print("current Language is ---> " + newValue.localCode);
                _selectedDropdownCityValue = newValue;
                if (_selectedDropdownCityValue.localCode == "ar") {
                  Provider.of<AppModel>(context, listen: false)
                      .changeLanguage("ar", context);
                }
                if (_selectedDropdownCityValue.localCode == "en") {
                  Provider.of<AppModel>(context, listen: false)
                      .changeLanguage("en", context);
                }
                Navigator.of(context).pushReplacementNamed(Routes.HOME);
              },
              items: dropdownCityList
                  ?.map<DropdownMenuItem<Country>>((Country value) {
                return DropdownMenuItem<Country>(
                  value: value,
                  child: Container(
                    width: 150,
                    child: Text(
                      value.countryName,
                      style: TextStyle(color: french_blue),
                    ),
                  ),
                );
              })?.toList(),
            ),
          )
        ],
      ),
    );
  }
}

class Country {
  Country(this.countryName, this.countryIcon, this.localCode);

  String countryName;
  String countryIcon;
  String localCode;
}
