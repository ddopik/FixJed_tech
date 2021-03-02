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

  changeUserPhone({context, onSuccess, onError, phone_1, phone_2}) {
    DIOManager().changePhone(
        phone: int.parse(phone_1),
        secondPhone: int.parse(phone_2),
        onSuccess: (response) {
          Navigator.of(context).pop();
        },
        onError: (errorResponse) {
          onError(errorResponse.toString());
        });
  }

  addNewPhone({context, onSuccess, onError, phone_1, phone_2}) {
    // DIOManager().addNewPhone(
    //     phone: phone_1,
    //     secondPhone: phone_2,
    //     onSuccess: (response) {
    //       Navigator.of(context).pop();
    //     },
    //     onError: (errorResponse) {
    //       onError(errorResponse.toString());
    //     });
  }
}
