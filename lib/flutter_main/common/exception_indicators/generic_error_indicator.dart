
import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/generated/l10n.dart';

import 'exception_indicator.dart';

/// Indicates that an unknown error occurred.
class GenericErrorIndicator extends StatelessWidget {
  var error;
  var title;

  GenericErrorIndicator({Key key, this.onTryAgain, this.error, this.title})
      : super(key: key);

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
    title: (title == null) ? S.of(context).someThingWrong : title,
        message: error ?? S.of(context).applicationError,
        assetName: 'assets/images/confused-face.png',
        onTryAgain: onTryAgain,
      );
}
