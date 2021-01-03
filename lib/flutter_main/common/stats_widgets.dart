import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/common/tools.dart';
import 'package:flutter_base_app/generated/l10n.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    // ..displayDuration = const Duration(milliseconds: 1000)
    // ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    // ..indicatorSize = 45.0
    // ..radius = 10.0
    // ..progressColor = Colors.yellow
    // ..backgroundColor = Colors.green
    // ..indicatorColor = Colors.yellow
    // ..textColor = Colors.yellow
    ..maskType = EasyLoadingMaskType.black
    ..maskColor = Colors.black.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}

/// For Loading Widget
void showLoading(context) {
  configLoading();
  EasyLoading.show(status: S.of(navigatorKey.currentContext).loading);
}

void dismissLoading() {
  EasyLoading.dismiss();
}

void showError(String message) {
  EasyLoading.showError(message, duration: Duration(seconds: 3));
}

void showSuccesses(context, String message) {
  EasyLoading.showSuccess(message, duration: Duration(seconds: 3));
}

void showInfo(message) {
  EasyLoading.showInfo(message, dismissOnTap: true);
}

void showToast(message) {
  EasyLoading.showToast(message, duration: Duration(seconds: 3));
}


void showProgress(message) {
  EasyLoading.showProgress(0.3, status: message);
}

void dismissStatsMessage() {
  EasyLoading.dismiss();
}
