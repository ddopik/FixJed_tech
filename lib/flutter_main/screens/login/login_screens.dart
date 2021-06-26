import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_app/flutter_main/app/app_model.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/res/dimen_const.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:flutter_base_app/network/dio_manager.dart';
import 'package:provider/provider.dart';

import 'login_slide_view.dart';
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
          alignment: Alignment.center,
          color: french_blue,
          child: SingleChildScrollView(
            child: renderLoginForm(),
          )),
    );
  }

  renderLoginForm() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Create an Account
          SizedBox(
            height: 20,
          ),
          Container(
            child: LoginSlideView(),
          ),
          // Rectangle 85
          SizedBox(height: MediaQuery.of(context).size.height * .12),
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
                hintText: S.of(context).email,
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
              controller: _passwordController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.name,
              style: TextStyle(color: french_blue),
              decoration: new InputDecoration(
                hintText: S.of(context).password,
              ),
              obscureText: true,
            ),
          ),
          //
          SizedBox(height: form_field_sepereator_space),

          InkWell(
            child: Container(
              width: MediaQuery.of(context).size.width * .70,
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x29000000),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        spreadRadius: 0)
                  ],
                  color: boring_green),
              child: Text(
                S.of(context).signIn,
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
        hideLoading();

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
        hideLoading();
      },
      userName: _userNameController.value.text.trim(),
      password: _passwordController.value.text.trim(),
    );
  }
}
