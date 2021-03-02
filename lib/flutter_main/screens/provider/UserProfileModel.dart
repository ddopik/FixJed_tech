import 'package:flutter_base_app/flutter_main/app/app_model.dart';
import 'package:flutter_base_app/flutter_main/screens/profile/model/user_profile_response.dart';
import 'package:flutter_base_app/network/dio_manager.dart';
import 'package:provider/provider.dart';

class UserProfileModel {
  getUserProfileData({onSuccess, onError}) {
    DIOManager().getProfileData(onSuccess: (response) {
      UserProfileResponse userProfileResponse =
          UserProfileResponse.fromJson(response);
      onSuccess(userProfileResponse);
    }, onError: (errorResponse) {
      onError(errorResponse.toString());
    });
  }

  submitChangePassword({newPassword, onSuccess, onError}) {}

  editUserFirstNameAndLastName(
      {context, onSuccess, onError, firstName, lastName}) {
    DIOManager().editUserFirstNameAndLastName(
        firstName:
            firstName ,
        lastName: lastName ,
        onSuccess: (response) {
          onSuccess();
        },
        onError: (errorResponse) {
          onError(errorResponse.toString());
        });
  }
}
