import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  static const _userSeen = "seen";
  static const _loggedIn = "'logged_in'";
  static const _userToken = "user_token";
  static const _appLanguage = "app_language";
  static const _userMail = "user_mail";
  static const _userID = "user_id";

  LocalPreferences._();

  // The _internal construction is just a name often given to constructors that are private to the class (the name is not required to be ._internal you can create a private constructor using any Class._someName construction).
  // LocalPreferences._internal();
  //
  // static final LocalPreferences _instance = LocalPreferences._internal();

  // factory LocalPreferences() {
  //   return _instance;
  // }
  static SharedPreferences prefs2;

  static  setupSharedPreferences() async {
    prefs2 = await SharedPreferences.getInstance();
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

  static Future<bool> setUpLocalPreferences() async {

  }

  /// check if the screen is already seen At the first time
  static Future<bool> checkFirstSeen() async {
    var _prefs= await SharedPreferences.getInstance();
    bool _seen = _prefs.getBool(_userSeen) ?? false;
    return _seen;
  }

  static Future<String> getUserToken() async {
    var _prefs= await SharedPreferences.getInstance();
    return _prefs.getString(_userToken) ?? null;
  }


  static setAppLanguage(String appLanguage) async {
    var _prefs= await SharedPreferences.getInstance();
    _prefs.setString(_appLanguage, appLanguage);
  }

  static Future<String> getAppLanguage() async {
    var _prefs= await SharedPreferences.getInstance();
    return _prefs.getString(_appLanguage) ?? 'ar';
  }

  static Future<String> getUserMail()  async {
    var _prefs= await SharedPreferences.getInstance();
    return  _prefs.getString(_userMail) ?? '';
  }

  // ignore: missing_return
  static Future<bool> setFirstSeen(bool state) async {
    var _prefs= await SharedPreferences.getInstance();
    _prefs.setBool(_userSeen, state);
  }

  static Future<bool> isAppFirstSeen() async {
    var _prefs= await SharedPreferences.getInstance();
    return _prefs.getBool(_userSeen) ?? true;
  }

  /// Check if the App is Login
  static Future<bool> checkLogin() async {
    var _prefs= await SharedPreferences.getInstance();
    return _prefs.getBool(_loggedIn) ?? false;
  }

  /// Check if the App is Login
  static setIsLoggedIn(bool state) async {
    var _prefs= await SharedPreferences.getInstance();
    _prefs.setBool(_loggedIn, state);
  }

  static setUserToken(String token) async {
    var _prefs= await SharedPreferences.getInstance();
    _prefs.setString(_userToken, token);

  }

  static setUserMail(String mail) async {
    var _prefs= await SharedPreferences.getInstance();
    _prefs.setString(_userMail, mail);

  }

  static setUserId(String id) async {
    var _prefs= await SharedPreferences.getInstance();
    _prefs.setString(_userID, id);
  }
}
