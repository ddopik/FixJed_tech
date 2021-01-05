import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static const _LOGIN_STATE = "user_login";
  static const _APP_SEEN = "app_seen";
  static const _TOKEN = "user_token";
  static const _USER_ID = "user_id";
  static const _USER_MAIL = "user_mail";

  static const _appLanguage = "app_language";

// The _internal construction is just a name often given to constructors that are private to the class (the name is not required to be ._internal you can create a private constructor using any Class._someName construction).

  PrefManager._internal();

  static final PrefManager _instance = PrefManager._internal();

  factory PrefManager() {
    return _instance;
  }

  SharedPreferences _prefs;

  Future<bool> setupSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    return true;
  }

  clearSharedPreferences() async {
    if (_instance._prefs != null) {
      await _prefs.clear();
    }
  }

  setString(String data, String key) async {
    await _prefs.setString(key, data);
  }

  void setUserToken(String data) async {
    await _prefs.setString(_TOKEN, data);
  }

  String getUserToken() {
    return _prefs.getString(_TOKEN) ?? null;
  }

  void setUserId(
    String data,
  ) {
    _prefs.setString(_USER_ID, data);
  }

  void setUserMail(
    String data,
  ) {
    _prefs.setString(_USER_MAIL, data);
  }

  getUserId() {
    return _prefs.getString(_USER_ID) ?? null;
  }

  String getUserMail() {
    return _prefs.getString(_USER_MAIL) ?? '';
  }

  void setLang(String userData) {
    _prefs.setString(_appLanguage, userData);
  }

  setUserLoginState(bool state) {
    _prefs.setBool(_LOGIN_STATE, state);
  }

  bool isUserLoggedIn()  {
    return _prefs.getBool(_LOGIN_STATE)??false;
  }

  setAppFirstSeenState(bool state) {
    _prefs.setBool(_APP_SEEN, state);
  }

  isAppFirstSeen() {
    return _prefs.getBool(_APP_SEEN);
  }

  String getStringWithKey(String key) {
    return _prefs.getString(key);
  }

  String getLang() {
    String lang = _prefs.getString(_appLanguage);
    return lang;
  }
}
