import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/app_bar_back_button.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/flutter_main/screens/profile/change_profile_photo_dialog_view.dart';
import 'package:flutter_base_app/flutter_main/screens/profile/model/user_profile_response.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class ProfileSettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  UserProfileResponse _userProfileResponse;
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: AppBarBackButton(),
        leadingWidth: 200,
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(child: getView())),
    );
  }

  getView() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width * .3,
              height: MediaQuery.of(context).size.height * .1,
              child: AutoSizeText(
                S.current.ProfileSetting,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontSize: text_head_size_2),
              ),
            ),
          ],
        ),
        Center(
          child: getImageProfileView(),
        ),
        renderLoginForm(),
        customActionButton(
            btnText: Text(
              S.of(context).SaveChanges,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white, fontSize: text_size_1),
            ),
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .065,
            btnColor: Color(0xff61ba66),
            btnRadius: 8.0,
            onPressed: () {
              validateUser();
            }),
      ],
    );
  }

  getImageProfileView() {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipOval(
            child: (_userProfileResponse?.imageUrl != null)
                ? CustomImageLoader.image(
                    url: _userProfileResponse?.imageUrl ?? '',
                    width: 180,
                    height: 180,
                    fit: BoxFit.contain)
                : Image(
                    image: AssetImage("assets/images/img_profile.jpeg"),
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: boring_green,
                ),
                onPressed: () {
                  changeProfilePhotoDialogView(context: context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  renderLoginForm() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Create an Account

          // Rectangle 85
          SizedBox(height: MediaQuery.of(context).size.height * .04),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            width: MediaQuery.of(context).size.width,
            child: AutoSizeText(
              S.of(context).EditYourPersonalInfo,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          Container(
            width: MediaQuery.of(context).size.width * .70,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 0)
                ],
                color: const Color(0xFFE7F5E8)),
            child: TextFormField(
              controller: _userNameController,
              autocorrect: false,
              enableSuggestions: false,
              style: TextStyle(color: french_blue),
              decoration: new InputDecoration(
                hintText: S.of(context).userName,
              ),
            ),
          ),
          //
          SizedBox(height: form_field_sepereator_space),
          Container(
            width: MediaQuery.of(context).size.width * .70,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 0)
                ],
                color: const Color(0xFFE7F5E8)),
            child: TextFormField(
              controller: _phoneNumberController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              style: TextStyle(color: french_blue),
              decoration: new InputDecoration(
                hintText: S.of(context).phoneNumber,
              ),
              obscureText: true,
            ),
          ),
          //
          SizedBox(height: MediaQuery.of(context).size.height * .19),
        ],
      ),
    );
  }

  validateUser() async {
    print("userMail --->" + _userNameController.value.text.trim());

    if (_userNameController.value.text.isEmpty ||
        !isEmail(_userNameController.value.text.trim())) {
      showError(S.of(context).invalidEmail);
    } else if (_phoneNumberController.value.text == null ||
        _phoneNumberController.value.text.length < 12) {
      showError(S.of(context).invalidPassword);
    } else {}
  }
}
