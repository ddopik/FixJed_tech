import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/flutter_main/common/config.dart';


/// this is model is used to initialize app configuration
/// and according to your needs can build all your providers and routes upon it
/// or just deal with it as normal Provider
/// */
class AppModel extends ChangeNotifier{

  bool darkTheme = false;
  String locale = AppDefaultConfig['DefaultLanguage'];

  AppModel(){
    notifyListeners();
  }


   getConfig() async {
 //todo load app main configuration here
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // locale = prefs.getString("language") ?? kAdvanceConfig['DefaultLanguage'];
      // darkTheme = prefs.getBool("darkTheme") ?? false;



  }
  Future<bool> changeLanguage(String country, BuildContext context) async {
    try {
       locale = country;

      // await prefs.setString("language", country);
      return true;
    } catch (err) {
      return false;
    }
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