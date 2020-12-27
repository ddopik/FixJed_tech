import 'package:flutter/cupertino.dart';
 import 'package:flutter_base_app/flutter_main/storage/local_preferences.dart';

/// this is model is used to initialize app configuration
/// and according to your needs can build all your providers and routes upon it
/// or just deal with it as normal Provider
/// */
class AppModel extends ChangeNotifier {
  bool darkTheme = false;
   String locale ="ar";



  changeLanguage(String local, BuildContext context) async {
    locale = local;
    LocalPreferences().setAppLanguage(local);
    notifyListeners();
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
