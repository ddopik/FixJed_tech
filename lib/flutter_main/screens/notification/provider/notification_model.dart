import 'package:flutter_base_app/flutter_main/screens/notification/model/fix_jed_notification.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

class NotificationModel {
  getNotification({onSuccess, onError}) {
    DIOManager().getNotification(onSuccess: (response) {
      List<FixJedNotification> data = (response as List)
          .map((model) => FixJedNotification.fromJson(model))
          .toList();
      onSuccess(data);
    }, onError: (error) {
      onError(error.toString());
    });
  }
}
