import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/flutter_main/storage/pref_manager.dart';

/// this is model is used to initialize app configuration
/// and according to your needs can build all your providers and routes upon it
/// or just deal with it as normal Provider
/// */
class AppModel extends ChangeNotifier {
  bool darkTheme = false;
  Locale locale = Locale.fromSubtags(languageCode: 'ar');

  Future<bool> setUpConfig() async {


// try {
//   var state = await PrefManager().setupSharedPreferences();
//   print("PrefManager has been initialized[2] $state");
//   return true;
// }catch(e){
//   print("PrefManager has been Error[3] " + e.toString());
//   return true;
// }

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // locale = prefs.getString("language") ?? kAdvanceConfig['DefaultLanguage'];
    // Session.shared.setupDefaultSession();
  }

  /// update AppMain consumer with this <local> value
  changeLanguage(String local, BuildContext context) async {
    if (local == "ar") {
      locale = Locale.fromSubtags(languageCode: 'ar');
    } else {
      locale = Locale.fromSubtags(languageCode: 'en');
    }
    PrefManager().setLang(local);
    notifyListeners();
  }

  setAppFirstSeen(bool state) {
    PrefManager().setAppFirstSeenState(state);
  }
  setIsUserLoggedIn(bool state){
    PrefManager().setUserLoginState(state);
  }

  bool isUserLoggedIn(){
    return PrefManager().isUserLoggedIn();
  }

  setUserToken(token) {
    PrefManager().setUserToken(token);
  }

  String getUserToken() {
    return PrefManager().getUserToken();
  }

  Future<bool> isAppFirstSeen() async {
    return await PrefManager().isAppFirstSeen();
  }

  setUserMail(mail) {
    PrefManager().setUserMail(mail);
  }

  String getUserMail() {
    return PrefManager().getUserMail();
  }

  setUserId(id) {
    PrefManager().setUserId(id.toString());
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
