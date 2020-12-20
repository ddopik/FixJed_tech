
import 'package:flutter/cupertino.dart';

import 'exception_indicator.dart';

/// Indicates that no items were found.
class EmptyListIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const ExceptionIndicator(
        title: 'No result Found',
        message: 'We couldn\'t find any results matching your applied Type.',
        assetName: 'assets/images/empty-box.png',
      );
}
