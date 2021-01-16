import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/stats_widgets.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State createState() {

    return _ForgotPasswordScreenState();
  }
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _obscureText = true;

  String _userName;
  final GlobalKey<FormState> _forgotPasswordState = GlobalKey<FormState>();

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background_init.png"),
                  fit: BoxFit.fill),
            ),
            child: renderForgotPasswordForm()),
      ),
    );
  }

  renderForgotPasswordForm() {
    return Form(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * .38,
        margin: EdgeInsets.only(top: 170),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Create an Account
            Column(
              children: [
                Text(
                  S.of(context).forgotPassword,
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Raleway",
                      fontStyle: FontStyle.normal,
                      fontSize: 22.0),
                  textAlign: TextAlign.center,
                ),
                // forgot password
                Text("أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور",
                    style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Raleway",
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                    textAlign: TextAlign.center),
              ],
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
            SizedBox(height: 12.0),
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
                  S.of(context).sendResetPasswordLink,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              onTap: () {
                resetPassword();
              },
            ),
          ],
        ),
      ),
      key: _forgotPasswordState,
    );
  }

  resetPassword() {
    if (_forgotPasswordState.currentState.validate()) {
      getResetLink();
    }
  }

  getResetLink() {
    showLoading(context);
    DIOManager().sendForgotPasswordMailRequest(
      onSuccess: (response) {
        dismissLoading();
        Navigator.of(context).pushReplacementNamed(Routes.SIGN_UP_SUCCESS);
      },
      onError: (response) {
        showError(response.toString());
        dismissLoading();
      },
      userName: _userName.replaceAll(" ", ''),
    );
  }
}
