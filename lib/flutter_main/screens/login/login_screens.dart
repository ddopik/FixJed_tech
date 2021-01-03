import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_app/flutter_main/app/app_model.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

import 'model/loginResponse.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  String _password;
  String _userName;
  final GlobalKey<FormState> _loginFormState = GlobalKey<FormState>();

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background_init.png"),
                fit: BoxFit.fill),
          ),
          child: renderLoginForm()),
    );
  }

  renderLoginForm() {
    return Form(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * .38,
        margin: EdgeInsets.only(top: 170),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Create an Account
            Text(
              S.of(context).login,
              style: const TextStyle(
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                  fontFamily: "Raleway",
                  fontStyle: FontStyle.normal,
                  fontSize: 22.0),
              textAlign: TextAlign.center,
            ),
            // Rectangle 85
            SizedBox(height: 12.0),
            Container(
              width: MediaQuery.of(context).size.width * .70,
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
                      hintText: S.of(context).email,
                      hintStyle: TextStyle(fontSize: 14)),
                  validator: (value) {
                    if (value.isEmpty) {
                      showToast(S.of(context).invalidEmail);
                      return '';
                    }
                    _userName = value;
                    return null;
                  }),
            ),
            //

            Container(
              width: MediaQuery.of(context).size.width * .70,
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
                      hintText: S.of(context).password,
                      hintStyle: TextStyle(fontSize: 14)),
                  // obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      showToast(S.of(context).invalidPassword);
                      return '';
                    }
                    _password = value;
                    return null;
                  }),
            ),
            //

            // Rectangle 85
            ////////////////////
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
                child: Text(
                  S.of(context).login,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              onTap: () {
                loginUser();
              },
            ),
////////////////////////////////
            // forgot password
            SizedBox(height: 6.0),
            GestureDetector(
              child: Text(S.of(context).forgotPassword,
                  style: const TextStyle(
                      color: boring_green,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Raleway",
                      fontStyle: FontStyle.normal,
                      decoration: TextDecoration.underline,
                      fontSize: 18),
                  textAlign: TextAlign.center),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.FORGOT_PASSWORD);
              },
            ),
            // doesnt have an account
            GestureDetector(
                child: Container(
                  height: 25,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                            fontSize: 16),
                        text: S.of(context).doNotHaveAccount),
                    TextSpan(
                      style: const TextStyle(
                          color: boring_green,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Raleway",
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.underline,
                          fontSize: 18),
                      text: "  " + S.of(context).signUp,
                    )
                  ])),
                ),
                onTap: () => Navigator.of(context).pushNamed(Routes.SIGN_UP))
          ],
        ),
      ),
      key: _loginFormState,
    );
  }

  loginUser() {
    if (_loginFormState.currentState.validate()) {
      _loginUser();
    }
  }

  _loginUser() {
    showLoading(context);
    DIOManager().sendLoginRequest(
      onSuccess: (response) {
        LoginResponse loginResponse = LoginResponse.fromJson(response);
        dismissLoading();

        AppModel().setUserMail(loginResponse.email);
        AppModel().setUserId(loginResponse.id.toString());
        Navigator.of(context).pushReplacementNamed(Routes.HOME);
      },
      onError: (response) {
        showError(S.of(context).invalidLogin);
        dismissLoading();
      },
      userName: _userName,
      password: _password,
    );
  }
}
