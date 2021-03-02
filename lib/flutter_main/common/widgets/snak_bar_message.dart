import 'package:flutter/material.dart';
import 'package:flutter_base_app/generated/l10n.dart';

void _failMessage(message, context) {
  /// Showing Error messageSnackBarDemo
  /// Ability so close message
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 30),
    action: SnackBarAction(
      label: S.of(context).close,
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}
