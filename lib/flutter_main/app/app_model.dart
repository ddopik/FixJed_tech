import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/flutter_main/storage/local_preferences.dart';

/// this is model is used to initialize app configuration
/// and according to your needs can build all your providers and routes upon it
/// or just deal with it as normal Provider
/// */
class AppModel extends ChangeNotifier {
  bool darkTheme = false;
  Locale locale = Locale.fromSubtags(languageCode: 'ar');

  /// update AppMain consumer with this <local> value
  changeLanguage(String local, BuildContext context) async {
    if (local == "ar") {
      locale = Locale.fromSubtags(languageCode: 'ar');
    } else {
      locale = Locale.fromSubtags(languageCode: 'en');
    }
    LocalPreferences().setAppLanguage(local);
    notifyListeners();
  }

  setAppFirstSeen(bool state) {
    LocalPreferences().setFirstSeen(state);
  }

  setUserToken(token) {
    LocalPreferences().setUserToken(token);
  }

  setUserMail(mail) {
    LocalPreferences().setUserMail(mail);
  }

  setUserId(id) {
    LocalPreferences().setUserId(id);
  }

  Future<void> updateTheme(bool theme) async {
    // try {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   darkTheme = theme;
    //   await prefs.setBool("darkTheme", theme);
    //   notifyListeners();
    // } catch (error) {
    //   printLog('[_getFacebookLink] error: ${error.toString()}');
    // }
  }
}
