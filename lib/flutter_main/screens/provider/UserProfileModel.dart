import 'package:flutter/material.dart';
import 'package:flutter_base_app/flutter_main/screens/profile/model/user_profile_response.dart';
import 'package:flutter_base_app/network/dio_manager.dart';

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

  editUserFirstNameAndLastName(
      {context, onSuccess, onError, firstName, lastName}) {
    DIOManager().editUserFirstNameAndLastName(
        firstName: firstName,
        lastName: lastName,
        onSuccess: (response) {
          onSuccess();
        },
        onError: (errorResponse) {
          onError(errorResponse.toString());
        });
  }

  changeUserPassword(
      {context, onSuccess, onError, password, newPassword, confirmPassword}) {


    DIOManager().changePassword(
        password: password,
        confirmPassword: confirmPassword,
        newPassword: newPassword,
        onSuccess: (response) {
          Navigator.of(context).pop();
        },
        onError: (errorResponse) {
          onError(errorResponse.toString());
        });
  }
}
