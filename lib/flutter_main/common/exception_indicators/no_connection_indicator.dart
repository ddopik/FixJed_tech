
import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/generated/l10n.dart';

import 'exception_indicator.dart';

/// Indicates that a connection error occurred.
class NoConnectionIndicator extends StatelessWidget {
  const NoConnectionIndicator({
    Key key,
    this.onTryAgain,
  }) : super(key: key);

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: S.of(context).noConnection,
        message: S.of(context).onTryAgainMessage,
        assetName: 'assets/images/frustrated-face.png',
        onTryAgain: onTryAgain,
      );
}
