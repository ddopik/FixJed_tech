import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_app/flutter_main/app/app_model.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:flutter_base_app/network/dio_manager.dart';
import 'package:provider/provider.dart';

import 'model/loginResponse.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background_init.png"),
                fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: renderLoginForm(),
          )),
    );
  }

  renderLoginForm() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Create an Account
          SizedBox(
            height: MediaQuery.of(context).size.height * .18,
          ),
          Text(
            S.of(context).login,
            style: const TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w600,
                fontFamily: "Raleway",
                fontStyle: FontStyle.normal,
                fontSize: 22.0),
            textAlign: TextAlign.center,
          ),
          // Rectangle 85
          SizedBox(height: 22.0),
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
              controller: _userNameController,
              autocorrect: false,
              enableSuggestions: false,
              decoration: new InputDecoration(
                  errorStyle: TextStyle(height: 0),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: S.of(context).email,
                  hintStyle: TextStyle(fontSize: 14)),
            ),
          ),
          //
          SizedBox(height: 16.0),
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
              controller: _passwordController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.name,
              decoration: new InputDecoration(
                  errorStyle: TextStyle(height: 0),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: S.of(context).password,
                  hintStyle: TextStyle(fontSize: 14)),
              obscureText: true,
            ),
          ),
          //
          SizedBox(height: 16.0),
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
              validateUser();
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
      key: _loginFormState,
    );
  }

  validateUser() async {


    print("userMail --->" + _userNameController.value.text.trim());
    _loginUser();
    if (_userNameController.value.text.isEmpty ||
        !isEmail(_userNameController.value.text.trim())) {
      showError(S.of(context).invalidEmail);
    } else if (_passwordController.value.text == null ||
        _passwordController.value.text.length < 6) {
      showError(S.of(context).invalidPassword);
    } else {
      _loginUser();
    }
  }

  _loginUser() async {
    clearFocus(context);
    showLoading(context);
    DIOManager().sendLoginRequest(
      onSuccess: (response) async {
        LoginResponse loginResponse = response;
        dismissLoading();

        Provider.of<AppModel>(context, listen: false)
            .setUserToken(loginResponse.token.toString());

        Provider.of<AppModel>(context, listen: false)
            .setUserId(loginResponse.id.toString);

        Provider.of<AppModel>(context, listen: false)
            .setUserMail(loginResponse.email.toString());

        Provider.of<AppModel>(context, listen: false)
            .setUserPhone(loginResponse.phone.toString());

        Provider.of<AppModel>(context, listen: false)
            .setUserName(loginResponse.username.toString());

        Provider.of<AppModel>(context, listen: false)
            .setUserFirstName(loginResponse.firstName.toString());

        Provider.of<AppModel>(context, listen: false)
            .setUserLastName(loginResponse.lastName.toString());

        Provider.of<AppModel>(context, listen: false)
            .setUserProfileImage(loginResponse.imageUrl.toString());

        Provider.of<AppModel>(context, listen: false).setIsUserLoggedIn(true);

        Navigator.of(context).pushReplacementNamed(Routes.HOME);
      },
      onError: (response) {
        showError("--" + response);
        dismissLoading();
      },
      userName: _userNameController.value.text.trim(),
      password: _passwordController.value.text.trim(),
    );
  }
}
