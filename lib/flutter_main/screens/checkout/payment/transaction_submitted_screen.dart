import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class TransactionSubmittedScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background_init.png"),
                fit: BoxFit.cover),
          ),
          child: Container(
            alignment: Alignment.center,
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(S.of(context).transactionSubmitted,
                    style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w800,
                        fontFamily: "Tajawal",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.center),
                // forgot password
                RichText(
                  text: TextSpan(
                    text: S.of(context).transactionSubmittedDesc,
                      style: TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Tajawal",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: "خدماتي ",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => print('click')),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
