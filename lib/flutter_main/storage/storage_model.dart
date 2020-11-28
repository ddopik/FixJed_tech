import 'package:flutter/cupertino.dart';
import 'package:flutter_base_app/flutter_main/storage/shared_preferences/local_preferences.dart';

class StorageModel extends ChangeNotifier {
  LocalPreferences _localPreferences = LocalPreferences();

  bool userLoggedIn =false ;
  bool appIsFirstSeen =true;

    _isUserLoggedIn() async {
      userLoggedIn =await _localPreferences.checkLogin();
      notifyListeners();

    }

  setUserLoggedIn(bool state) {
    _localPreferences.setIsLoggedIn(state);
  }

  setIsAppFirstTimeOpen(bool state) {
    _localPreferences.setFirstSeen(state);
  }

     isAppFirstTimeSeen() async{
       appIsFirstSeen = await _localPreferences.getIsAppFirstSeen();
       notifyListeners();
  }
}
