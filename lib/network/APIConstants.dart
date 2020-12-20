import 'package:flutter_base_app/flutter_main/storage/local_preferences.dart';

class APIConstants {
  static final Map<String, String> headers = {
    "Authorization": "Bearer ${LocalPreferences().getUserToken()}",
    "Accept-Language": LocalPreferences().getAppLanguage().toString(),
  };
  static const baseURL =
      'https://woocommerce-385096-1584784.cloudwaysapps.com/wp-json/wc/v3';
}
