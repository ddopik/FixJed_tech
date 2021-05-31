import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/res/font_const.dart';
import 'package:flutter_base_app/flutter_main/common/widgets/custom_action_button.dart';
import 'package:flutter_base_app/generated/l10n.dart';

/// Basic layout for indicating that an exception occurred.
class ExceptionIndicator extends StatelessWidget {
  ExceptionIndicator({
    @required this.title,
    @required this.assetName,
    this.message,
    this.onTryAgain,
    Key key,
  })  : assert(title != null),
        assert(assetName != null),
        super(key: key);
  final String title;
  final String message;
  final String assetName;
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    assetName,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  if (message != null)
                    const SizedBox(
                      height: 16,
                    ),
                  if (message != null)
                    Text(
                      message,
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
              customActionButton(
                  btnText: Text(
                    S.current.tryAgain,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white, fontSize: text_size_1),
                  ),
                  width: MediaQuery.of(context).size.width * .9,
                  btnColor: Color(0xFFF49D1A),
                  btnRadius: 7.0,
                  onPressed: () {
                    onTryAgain();
                  })
            ],
          ),
        ),
      );
}
