import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  final _userSeen = "seen";
  final _loggedIn = "'logged_in'";
  final _userToken = "user_token";
  final _appLanguage = "app_language";
  final _userMail = "user_mail";
  final _userID = "user_id";
  static LocalPreferences _localPreferences;
  static LocalPreferences _factoryLocalPreferences;
  SharedPreferences _prefs;

  // The _internal construction is just a name often given to constructors that are private to the class (the name is not required to be ._internal you can create a private constructor using any Class._someName construction).
  LocalPreferences._internal();

  static final LocalPreferences _instance = LocalPreferences._internal();

  factory LocalPreferences() {
    return _instance;
  }

  // LocalPreferences._();
  // static LocalPreferences get getInstance {
  //   if (_localPreferences == null) {
  //     _localPreferences = LocalPreferences._();
  //   }
  //
  //   if (_localPreferences._prefs == null) {
  //     _localPreferences.setUpLocalPreferences();
  //   }
  //   return _localPreferences;
  // }

  Future<bool> setUpLocalPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// check if the screen is already seen At the first time
  bool checkFirstSeen() {
    bool _seen = _prefs.getBool(_userSeen) ?? false;
    return _seen;
  }

  String getUserToken() {
    return _prefs.getString(_userToken) ?? null;
  }

  setAppLanguage(String appLanguage) {
    _prefs.setString(_appLanguage, appLanguage) ?? 'ar';
  }

  String getAppLanguage() {
    return _prefs.getString(_appLanguage) ?? 'ar';
  }


  String getUserMail() {
    return _prefs.getString(_userMail) ?? '';
  }

  // ignore: missing_return
  bool setFirstSeen(bool state) {
    _prefs.setBool(_userSeen, state);
  }

  bool isAppFirstSeen() {
    return _prefs.getBool(_userSeen) ?? true;
  }

  /// Check if the App is Login
  bool checkLogin() {
    return _prefs.getBool(_loggedIn) ?? false;
  }

  /// Check if the App is Login
  setIsLoggedIn(bool state) async {
    _prefs.setBool(_loggedIn, state);
  }

  setUserToken(String token) {
    _prefs.setString(_userToken, token);
  }

  setUserMail(String mail) {
    _prefs.setString(_userMail, mail);
  }

  setUserId(String id) {
    _prefs.setString(_userID, id);
  }
}
