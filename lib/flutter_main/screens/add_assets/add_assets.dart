import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/colors.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/app_bar_back_button.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class AddAssetsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddAssetsScreen();
}

class _AddAssetsScreen extends State<AddAssetsScreen> {
  var a = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              leading: AppBarBackButton(),
              leadingWidth: 200,
            ),
            body: Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    height: MediaQuery.of(context).size.height * .05,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      S.current.ASSETS,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: 11,
                          itemBuilder: (context, i) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Text(S.of(context).Assetname + " $i"),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {}),
                                    Text("1"),
                                    IconButton(
                                        icon: Icon(
                                          Icons.do_disturb_on_rounded,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {}),
                                  ],
                                )
                              ],
                            );
                          })),
                  customActionButton(
                      btnText: Text(
                        S.of(context).REQUESTASSET,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.white, fontSize: text_size_1),
                      ),
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .065,
                      btnColor: Color(0xff61ba66),
                      btnRadius: 8.0,
                      onPressed: () {
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            a = 1;
                          });
                          Navigator.pop(context);
                        });
                      })
                ],
              ),
            )),
        a == 1
            ? Positioned(
                top: 43,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .06,
                  color: boring_green,
                  child: Text(
                    S.of(context).Assetsrequesthassuccessfullysent,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
