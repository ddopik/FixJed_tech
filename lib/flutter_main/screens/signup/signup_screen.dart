import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

import '../../../generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _signUpFormState = GlobalKey<FormState>();
  final TextEditingController _password_controller = TextEditingController();
  final TextEditingController _confirm_password_controller =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String firstName, lastName, userName, email, phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background_init.png"),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: renderSignUpForm(),
          )),
    );
  }

  renderSignUpForm() {
    var mainButtonsWidth = MediaQuery.of(context).size.width * .85;
    return Form(
      key: _signUpFormState,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * .70,
        margin: EdgeInsets.only(top: 170),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Create an Account
            Text(S.of(context).signUp,
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Raleway",
                    fontStyle: FontStyle.normal,
                    fontSize: 22.0),
                textAlign: TextAlign.center),
            // Rectangle 85
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .40,
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
                      enableInteractiveSelection: false,
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
                          hintText: S.of(context).firstName,
                          hintStyle: TextStyle(fontSize: 14)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return S.of(context).invalid;
                        }
                        firstName = value;
                        return null;
                      }),
                ),
                SizedBox(width: 12.0),
                Container(
                  width: MediaQuery.of(context).size.width * .40,
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
                          hintText: S.of(context).lastName,
                          hintStyle: TextStyle(fontSize: 14)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return S.of(context).invalid;
                        }
                        lastName = value;
                        return null;
                      }),
                ),
              ],
            ),
            //
            Container(
              width: mainButtonsWidth,
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
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                    errorStyle: TextStyle(height: 0),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: S.of(context).email,
                    hintStyle: TextStyle(fontSize: 14),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return S.of(context).invalid;
                    }
                    email = value;
                    return null;
                  }),
            ),
            //
            Container(
              width: mainButtonsWidth,
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
                    hintText: S.of(context).userName,
                    hintStyle: TextStyle(fontSize: 14),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return S.of(context).invalid;
                    }
                    userName = value;
                    return null;
                  }),
            ),
            //
            Container(
              width: mainButtonsWidth,
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
                  controller: _password_controller,
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
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty && value.length < 6) {
                      return S.of(context).invalid;
                    }
                    return null;
                  }),
            ),

            Container(
              width: mainButtonsWidth,
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
                  controller: _confirm_password_controller,
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
                    hintText: S.of(context).confirmPassword,
                    hintStyle: TextStyle(fontSize: 14),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return S.of(context).invalid;
                    } else if (_password_controller.value !=
                        _confirm_password_controller.value) {
                      return S.of(context).notMatchedPassword;
                    }
                    return null;
                  }),
            ),
            //

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
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
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    enabled: false,
                    decoration: new InputDecoration(
                        errorStyle: TextStyle(height: 0),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "+20"),
                  ),
                ),
                SizedBox(width: 12.0),
                Container(
                  width: MediaQuery.of(context).size.width * .60,
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
                      controller: _phoneNumberController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.phone,
                      decoration: new InputDecoration(
                        errorStyle: TextStyle(height: 0),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: S.of(context).phoneNumber,
                        hintStyle: TextStyle(fontSize: 14),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return S.of(context).invalid;
                        } else if (_phoneNumberController.value.text.length !=
                            11) {
                          return S.of(context).invalidEmptyPhoneNumber;
                        }
                        phoneNumber = value;
                        return null;
                      }),
                ),
              ],
            ),

            // Container(
            //   width: mainButtonsWidth,
            //   height: 45,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(24)),
            //       boxShadow: [
            //         BoxShadow(
            //             color: const Color(0x29000000),
            //             offset: Offset(0, 3),
            //             blurRadius: 6,
            //             spreadRadius: 0)
            //       ],
            //       color: const Color(0xffffffff)),
            //   child: TextFormField(
            //     cursorColor: Colors.black,
            //     keyboardType: TextInputType.name,
            //     decoration: new InputDecoration(
            //       border: InputBorder.none,
            //       focusedBorder: InputBorder.none,
            //       enabledBorder: InputBorder.none,
            //       disabledBorder: InputBorder.none,
            //       contentPadding:
            //           EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            //       hintText: "Invitation Code (Optional)",
            //     ),
            //   ),
            // ), //

            // Rectangle 85

            // forgot password
            SizedBox(height: 6.0),
            Text(S.of(context).policyHint,
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Raleway",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.7),
                textAlign: TextAlign.center),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width * .70,
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
                    S.of(context).signUp,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              onTap: () => _signUpUser(),
            ),
            // doesnt have an account
            GestureDetector(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      style: const TextStyle(
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Raleway",
                          fontStyle: FontStyle.normal,
                          fontSize: 12.7),
                      text: S.of(context).alreadyHaveAccount),
                  TextSpan(
                      style: const TextStyle(
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Raleway",
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.underline,
                          fontSize: 16.7),
                      text: S.of(context).login)
                ])),
                onTap: () => Navigator.of(context).popAndPushNamed(Routes.LOGIN)
                // onTap: () => Navigator.of(context).pushAndRemoveUntil(Routes.LOGIN)
                )
          ],
        ),
      ),
    );
  }

  _signUpUser() {
    if (_signUpFormState.currentState.validate()) {
      showLoading(context);
      DIOManager().createUser(
          onSuccess: (response) {
            dismissLoading();
            Navigator.of(context).pushReplacementNamed(Routes.SIGN_UP_SUCCESS);

          },
          onError: (message) {
            dismissLoading();
            showError(message);
          },
          firstName: firstName,
          userName: userName,
          lastName: lastName,
          mail: email,
          phone: phoneNumber,
          password: _password_controller.value.text);
    }

    logger.d('Failed to validate SignUpForm');
  }
}
