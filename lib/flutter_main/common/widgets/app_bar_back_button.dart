import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/generated/l10n.dart';

class AppBarBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 21,
            ),
            onPressed: () {
              Navigator.of(context).maybePop();
            }),
        Container(
            width: MediaQuery.of(context).size.width * .2,
            child: AutoSizeText(
              S.current.back,
              softWrap: false,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Color(0xffffffff)),
            ))
      ],
    );
  }
}
