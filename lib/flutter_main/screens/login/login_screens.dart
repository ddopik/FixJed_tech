import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_app/flutter_main/app/route.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  String _password;
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
                fit: BoxFit.fill
            ),
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
              "Log in",
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
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.name,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Email /user Name",
                      hintStyle: TextStyle(fontSize: 14)),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Invalid User name";
                    }
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
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Password",
                      hintStyle: TextStyle(fontSize: 14)
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Invalid Password";
                    }
                    return null;
                  }),
            ),
            //

            // Rectangle 85
            ////////////////////
        InkWell(
          child:
            Container(
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
                  "log in",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),

              ),onTap: (){loginUser();},),
////////////////////////////////
            // forgot password
            SizedBox(height: 6.0),
            Text("Forgot Password?",
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Raleway",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.7),
                textAlign: TextAlign.center),
            // doesnt have an account
            GestureDetector(
                child: Container(
                  height: 20,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.7),
                        text: "don't have an account? "),
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.underline,
                            fontSize: 14.7),
                        text: "Sign up",
                    )
                  ])),
                ),
                onTap: () => Navigator.of(context).pushNamed(Routes.SIGNUP))
          ],
        ),
      ),
      key: _loginFormState,
    );
  }

  loginUser() {
    logger.i("loginUser --> Pressed");
    if (_loginFormState.currentState.validate()) {
      Navigator.of(context).pushReplacementNamed(Routes.HOME);
    } else {

    }
  }
}
