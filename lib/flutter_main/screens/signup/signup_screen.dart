import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/model/ErrorResponse.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
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
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
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
    return Container(
      alignment: Alignment.topCenter,
      height: MediaQuery.of(context).size.height,
      child: Form(
        key: _signUpFormState,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(S.of(context).createNewAccount,
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Raleway",
                    fontStyle: FontStyle.normal,
                    fontSize: 24.0),
                textAlign: TextAlign.center),
            // Rectangle 85
         
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Create an Account

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .40,
                      height: input_form_height,
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
                        controller: _firstNameController,
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
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return S.of(context).invalid;
                        //   }
                        //   firstName = value;
                        //   return null;
                        // }
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Container(
                      width: MediaQuery.of(context).size.width * .40,
                      height: input_form_height,
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
                        controller: _lastNameController,
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
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return S.of(context).invalid;
                        //   }
                        //   lastName = value;
                        //   return null;
                        // }
                      ),
                    ),
                  ],
                ),
                SizedBox(height: form_field_sepereator_space),
                //
                Container(
                  width: mainButtonsWidth,
                  height: input_form_height,
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
                    controller: _emailController,
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
                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return S.of(context).invalid;
                    //   }
                    //   email = value;
                    //   return null;
                    // }
                  ),
                ),
                SizedBox(height: form_field_sepereator_space),
                //
                Container(
                  width: mainButtonsWidth,
                  height: input_form_height,
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
                      hintText: S.of(context).userName,
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
                SizedBox(height: form_field_sepereator_space),
                //
                Container(
                  width: mainButtonsWidth,
                  height: input_form_height,
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
                    controller: _passwordController,
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
                    // validator: (value) {
                    //   if (value.isEmpty && value.length < 6) {
                    //     return S.of(context).invalid;
                    //   }
                    //   return null;
                    // }
                  ),
                ),
                SizedBox(height: form_field_sepereator_space),
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
                      controller: _confirmPasswordController,
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
                        // if (value.isEmpty) {
                        //   return S.of(context).invalid;
                        // } else if (_passwordController.value !=
                        //     _confirmPasswordController.value) {
                        //   return S.of(context).notMatchedPassword;
                        // }
                        return null;
                      }),
                ),
                SizedBox(height: form_field_sepereator_space),
                //

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                            // if (value.isEmpty) {
                            //   return S.of(context).invalid;
                            // } else if (_phoneNumberController.value.text.length !=
                            //     11) {
                            //   return S.of(context).invalidEmptyPhoneNumber;
                            // }
                            // phoneNumber = value;
                            return null;
                          }),
                    ),
                    SizedBox(width: form_field_sepereator_space),
                    Container(
                      width: MediaQuery.of(context).size.width * .20,
                      height: input_form_height,
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
                        readOnly: true,
                        decoration: new InputDecoration(
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
                  ],
                ),

                SizedBox(height: 32.0),
                Text(S.of(context).policyHint,
                    style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Raleway",
                        fontStyle: FontStyle.normal,
                        fontSize: 12.7),
                    textAlign: TextAlign.center),
                SizedBox(height: 16.0),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .85,
                    height: input_form_height,
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
                SizedBox(height: 16.0),
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
                          text: S.of(context).alreadyHaveAccount + "    "),
                      TextSpan(
                          style: const TextStyle(
                              color: boring_green,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Raleway",
                              fontStyle: FontStyle.normal,
                              decoration: TextDecoration.underline,
                              fontSize: 16.7),
                          text: S.of(context).login)
                    ])),
                    onTap: () =>
                        Navigator.of(context).popAndPushNamed(Routes.LOGIN)
                    // onTap: () => Navigator.of(context).pushAndRemoveUntil(Routes.LOGIN)
                    )
              ],
            )
          ],
        ),
      ),
    );
  }

  _signUpUser() {
    if (validateSignUpForm()) {
      clearFocus(context);
      showLoading(context);
      DIOManager().createUser(
          onSuccess: (response) {
            dismissLoading();
            Navigator.of(context).pushReplacementNamed(Routes.SIGN_UP_SUCCESS);
          },
          onError: (message) {
            dismissLoading();
            if (message is ErrorResponse) {
              showError(message.errors[0].message);
            } else {
              showError(message);
            }
          },
          firstName: _firstNameController.value.text,
          userName: _userNameController.value.text,
          lastName: _lastNameController.value.text,
          mail: _emailController.value.text,
          phone: _phoneNumberController.value.text,
          password: _passwordController.value.text);
    }
  }

  validateSignUpForm() {
    print("_firstNameController.value.text --->" +
        _firstNameController.value.text);
    if (_firstNameController.value.text.isEmpty) {
      showError(S.of(context).invalidFirstName);
      return false;
    }
    if (_lastNameController.value.text.isEmpty) {
      showError(S.of(context).invalidLastName);
      return false;
    }
    if (_emailController.value.text.isEmpty ||
        !isEmail(_emailController.value.text)) {
      showError(S.of(context).invalidEmail);
      return false;
    }
    if (_userNameController.value.text.isEmpty) {
      showError(S.of(context).invalidUserName);
      return false;
    }
    if (_passwordController.value.text.isEmpty) {
      showError(S.of(context).invalidPassword);
      return false;
    } else if (_passwordController.value.text.length < 6) {
      showError(S.of(context).passwordErrorLength);
      return false;
    } else if (_passwordController.value.text.contains(" ")) {
      showError(S.of(context).passwordSpaceError);
      return false;
    }

    if (_confirmPasswordController.value.text.isEmpty) {
      showError(S.of(context).invalidPassword);
      return false;
    } else if (_confirmPasswordController.value.text.length > 6) {
      showError(S.of(context).passwordWordNotMatched);
      return false;
    }

    if (_phoneNumberController.value.text.isEmpty ||
        _phoneNumberController.value.text.length < 11 ||
        !isNumber(_phoneNumberController.value.text)) {
      showError(S.of(context).invalidEmptyPhoneNumber);
      return false;
    }

    return true;
  }
}
