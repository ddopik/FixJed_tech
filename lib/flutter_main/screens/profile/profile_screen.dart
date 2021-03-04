import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/app_model.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_image_loader.dart';
import 'package:flutter_base_app/flutter_main/screens/profile/model/user_profile_response.dart';
import 'package:flutter_base_app/flutter_main/screens/provider/UserProfileModel.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:provider/provider.dart';

import 'changePasswordDialogView.dart';
import 'changeProfileNameDialogView.dart';
import 'change_profile_photo_dialog_view.dart';
import 'edit_phone_dialog_view.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _profileFormState = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();
  String firstName, lastName, userName, email, phoneNumber;
  UserProfileModel _userProfileModel;
  UserProfileResponse _userProfileResponse;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() {
    _userProfileModel = UserProfileModel();
    _userProfileModel.getUserProfileData(onSuccess: (response) {
      setState(() {
        _userProfileResponse = response;
      });
    }, onError: (error) {
      showError(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [getImageProfileView(), renderProfileFormView()],
                ),
                SizedBox(
                  height: 32,
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .85,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                              spreadRadius: 0)
                        ],
                        color: boring_green),
                    child: InkWell(
                      child: Text(
                        S.of(context).save,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  // onTap: () => updateUserData(),
                ),
                SizedBox(
                  height: 32,
                ),
              ],
            )),
      ),
    );
  }

  renderProfileFormView() {
    var mainButtonsWidth = MediaQuery.of(context).size.width * .85;
    return Container(
      alignment: Alignment.topCenter,
      child: Form(
        key: _profileFormState,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 24.0),
            Row(
              children: [
                SizedBox(
                  width: 32,
                ),
                Expanded(
                  child: Text(S.of(context).personalInfo,
                      style: const TextStyle(
                          color: french_blue,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Raleway",
                          fontStyle: FontStyle.normal,
                          fontSize: 24.0),
                      textAlign: TextAlign.start),
                )
              ],
            ),
            // Rectangle 85
            SizedBox(height: 24.0),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Create an Account
                Container(
                  width: mainButtonsWidth,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      border: Border.all(color: boring_green, width: 0.5),
                      color: const Color(0xffe7f5e8)),
                  child: TextFormField(
                    controller: _firstNameController,
                    enableInteractiveSelection: false,
                    readOnly: true,
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
                      hintText: _userProfileResponse?.firstName ??
                          S.of(context).firstName,
                      hintStyle: TextStyle(fontSize: 14),
                      suffixIcon: Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                    ),
                    onTap: () {
                      changeProfileNameDialogView(
                          context: context,
                          onChangeProfileClick: onChangeProfileClick);
                    },
                  ),
                ),

                SizedBox(height: 16.0),
                //
                Container(
                  width: mainButtonsWidth,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      border: Border.all(color: boring_green, width: 0.5),
                      color: Color(0xffe7f5e8)),
                  child: TextFormField(
                    controller: _emailController,
                    cursorColor: Colors.black,
                    readOnly: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration(
                      errorStyle: TextStyle(height: 0),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText:
                          _userProfileResponse?.email ?? S.of(context).email,
                      hintStyle: TextStyle(fontSize: 14),
                    ),
                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return S.of(context).invalid;
                    //   }
                    //   email = value;
                    //   return null;
                    // }
                  ),
                ),
                SizedBox(height: 16.0),
                //
                Container(
                  width: mainButtonsWidth,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                      border: Border.all(color: boring_green, width: 0.5),
                      color: Color(0xffe7f5e8)),
                  child: TextFormField(
                    controller: _userNameController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    decoration: new InputDecoration(
                      errorStyle: TextStyle(height: 0),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: _userProfileResponse?.username ??
                          S.of(context).userName,
                      hintStyle: TextStyle(fontSize: 14),
                    ),

                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return S.of(context).invalid;
                    //   }
                    //   userName = value;
                    //   return null;
                    // }
                  ),
                ),
                SizedBox(height: 16.0),
                //
                Container(
                  width: mainButtonsWidth,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      border: Border.all(color: boring_green, width: 0.5),
                      color: Color(0xffe7f5e8)),
                  child: TextFormField(
                    controller: _passwordController,
                    readOnly: true,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    decoration: new InputDecoration(
                      errorStyle: TextStyle(height: 0),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: S.of(context).password,
                      hintStyle: TextStyle(fontSize: 14),
                      suffixIcon: Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                    ),
                    onTap: () {
                      changePasswordDialogView(
                          context: context,
                          onChangePasswordClick: changeUserPassword);
                    },
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 16.0),

                //

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: mainButtonsWidth,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          border: Border.all(color: boring_green, width: 0.5),
                          color: const Color(0xffe7f5e8)),
                      child: TextFormField(
                        controller: _phoneNumberController,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.phone,
                        readOnly: true,
                        decoration: new InputDecoration(
                            errorStyle: TextStyle(height: 0),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: _userProfileResponse?.phone ??
                                S.of(context).phoneNumber,
                            hintStyle: TextStyle(fontSize: 14),
                            suffixIcon: Icon(
                              Icons.edit,
                              color: Colors.green,
                            )),
                        onTap: () {
                          addNewPhoneDialogView(
                              context: context,
                              title: S.of(context).editPhone,
                              currentPhoneNumber:
                                  Provider.of<AppModel>(context, listen: false)
                                      .getUserPhone(),
                              addPhoneNumber: changeUserPhone);
                        },
                      ),
                    ),
                    SizedBox(width: 12.0),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  width: MediaQuery.of(context).size.width * .95,
                  height: 45,
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.add_circle_outlined,
                            color: boring_green,
                          ),
                          iconSize: 25,
                          onPressed: () async {
                            addNewPhoneDialogView(
                                context: context,
                                title: S.of(context).addNewPhone,
                                currentPhoneNumber: S.of(context).phoneNumber,
                                addPhoneNumber: addPhoneNumber);
                          }),
                      // اضف رقم هاتف
                      Text(S.of(context).addNewPhone,
                          style: const TextStyle(
                              color: french_blue,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Tajawal",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left)
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: mainButtonsWidth,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      border: Border.all(color: boring_green, width: 0.5),
                      color: const Color(0xffe7f5e8)),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    readOnly: true,
                    decoration: new InputDecoration(
                        errorStyle: TextStyle(height: 0),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: S.of(context).myAddresses,
                        hintStyle: TextStyle(fontSize: 14),
                        suffixIcon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.green,
                        )),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(Routes.ADDRESS_LIST_SCREEN);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
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

  onChangeProfileClick(String firstName, String lastName) {
    showLoading(context);
    var f_name, l_name;
    if (firstName.isEmpty) {
      f_name = Provider.of<AppModel>(context, listen: false).getUserFirstName();
      print("default first name :$f_name");
    } else {
      f_name = firstName;
    }
    if (lastName.isEmpty) {
      l_name = Provider.of<AppModel>(context, listen: false).getUserLastName();
      print("default last name :$l_name");
    } else {
      l_name = lastName;
    }
    print("first name :$f_name --- lastName : $l_name");
    UserProfileModel().editUserFirstNameAndLastName(
        firstName: f_name,
        lastName: l_name,
        onSuccess: () {
          showSuccesses(context, S.current.updated);
          dismissLoading();
          getUserData();
        },
        onError: (error) {
          showError(error.toString());
          dismissLoading();
        });
  }

  changeUserPassword(String oldPassword, String newPassword) {
    showLoading(context);
    print("oldPassword : $oldPassword ---- newPassword : $newPassword");
    UserProfileModel().changeUserPassword(
        password: oldPassword,
        confirmPassword: newPassword,
        newPassword: newPassword,
        onSuccess: () {
          showSuccesses(context, S.current.updated);
          dismissLoading();
          getUserData();
          Navigator.of(context).pop();
        },
        onError: (error) {
          showError(error.toString());
          dismissLoading();
        });
  }

  changeUserPhone(String phoneNumber) {
    return;
    showLoading(context);
    print("changeUserPhone  $phoneNumber");
    UserProfileModel().changeUserPhone(
        phone_1: phoneNumber,
        phone_2: "",
        onSuccess: () {
          showSuccesses(context, S.current.updated);
          dismissLoading();
          getUserData();
          Navigator.of(context).pop();
        },
        onError: (error) {
          showError(error.toString());
          dismissLoading();
        });
  }

  addPhoneNumber(String phoneNumber) {
    print("changeUserPhone  $phoneNumber");

    showLoading(context);

    UserProfileModel().addNewPhone(
        phone_1: Provider.of<AppModel>(context, listen: false).getUserPhone(),
        phone_2: phoneNumber,
        onSuccess: () {
          showSuccesses(context, S.current.updated);
          dismissLoading();
          getUserData();
          Navigator.of(context).pop();
        },
        onError: (error) {
          showError(error.toString());
          dismissLoading();
        });
  }
}
