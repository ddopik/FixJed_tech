import 'package:flutter_base_app/flutter_main/screens/checkout/address/model/Address.dart';

class UserProfileResponse {
  int _id;
  String _username;
  String _firstName;
  String _lastName;
  String _email;
  String _phone;
  dynamic _secondPhone;
  dynamic _imageUrl;
  List<Address> _addresses;
  dynamic _errors;

  int get id => _id;

  String get username => _username;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get email => _email;

  String get phone => _phone;

  dynamic get secondPhone => _secondPhone;

  dynamic get imageUrl => _imageUrl;

  List<Address> get addresses => _addresses;

  dynamic get errors => _errors;

  UserProfileResponse(
      {int id,
      String username,
      String firstName,
      String lastName,
      String email,
      String phone,
      dynamic secondPhone,
      dynamic imageUrl,
      List<Address> addresses,
      dynamic errors}) {
    _id = id;
    _username = username;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _secondPhone = secondPhone;
    _imageUrl = imageUrl;
    _addresses = addresses;
    _errors = errors;
  }

  UserProfileResponse.fromJson(dynamic json) {
    _id = json["id"];
    _username = json["username"];
    _firstName = json["firstName"];
    _lastName = json["lastName"];
    _email = json["email"];
    _phone = json["phone"];
    _secondPhone = json["secondPhone"];
    _imageUrl = json["imageUrl"];
    if (json["addresses"] != null) {
      _addresses = [];
      json["addresses"].forEach((v) {
        _addresses.add(Address.fromJson(v));
      });
    }
    _errors = json["errors"];
  }
}
