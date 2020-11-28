import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  final userSeen = "seen";
  final loggedIn = "'logged_in'";

  /// check if the screen is already seen At the first time
  Future<bool> checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = prefs.getBool(userSeen) ?? false;
    return _seen;
  }

  // ignore: missing_return
  Future<bool> setFirstSeen(bool state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(userSeen, state);
  }

  Future<bool> getIsAppFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getBool(userSeen);
  }

  /// Check if the App is Login
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loggedIn) ?? false;
  }

  /// Check if the App is Login
  setIsLoggedIn(bool state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(loggedIn, state);
  }
}
