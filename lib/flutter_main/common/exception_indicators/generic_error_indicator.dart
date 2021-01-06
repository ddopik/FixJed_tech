
import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/generated/l10n.dart';

import 'exception_indicator.dart';

/// Indicates that an unknown error occurred.
class GenericErrorIndicator extends StatelessWidget {
  const GenericErrorIndicator({
    Key key,
    this.onTryAgain,
  }) : super(key: key);

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: S.of(context).someThingWrong,
        message: S.of(context).applicationError,
        assetName: 'assets/images/confused-face.png',
        onTryAgain: onTryAgain,
      );
}
