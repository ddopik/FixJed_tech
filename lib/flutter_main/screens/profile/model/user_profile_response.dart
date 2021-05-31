
class UserProfileResponse {
  int _id;
  String _username;
  String _firstName;
  String _lastName;
  String _email;
  String _phone;
  dynamic _secondPhone;
  dynamic _imageUrl;

  dynamic _errors;

  int get id => _id;

  String get username => _username;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get email => _email;

  String get phone => _phone;

  dynamic get secondPhone => _secondPhone;

  dynamic get imageUrl => _imageUrl;


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
      dynamic errors}) {
    _id = id;
    _username = username;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _secondPhone = secondPhone;
    _imageUrl = imageUrl;

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

    _errors = json["errors"];
  }
}
