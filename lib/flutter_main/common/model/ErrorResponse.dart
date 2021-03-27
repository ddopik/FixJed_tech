class ErrorResponse {
  ErrorResponse({
    this.id,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.description,
    this.version,
    this.isEnabled,
    this.errors,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.confirmPassword,
    this.roles,
    this.userType,
    this.addresses,
    this.accountNonExpired,
    this.accountNonLocked,
    this.credentialsNonExpired,
    this.tokenNonExpired,
  });

  dynamic id;
  dynamic createdBy;
  dynamic createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  dynamic description;
  dynamic version;
  dynamic isEnabled;
  List<Error> errors;
  String username;
  String firstName;
  String lastName;
  String email;
  String phone;
  String password;
  String confirmPassword;
  dynamic roles;
  dynamic userType;
  dynamic addresses;
  bool accountNonExpired;
  bool accountNonLocked;
  bool credentialsNonExpired;
  bool tokenNonExpired;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        id: json["id"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        updatedBy: json["updatedBy"],
        updatedDate: json["updatedDate"],
        description: json["description"],
        version: json["version"],
        isEnabled: json["isEnabled"],
        errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        roles: json["roles"],
        userType: json["userType"],
        addresses: json["addresses"],
        accountNonExpired: json["accountNonExpired"],
        accountNonLocked: json["accountNonLocked"],
        credentialsNonExpired: json["credentialsNonExpired"],
        tokenNonExpired: json["tokenNonExpired"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "updatedBy": updatedBy,
        "updatedDate": updatedDate,
        "description": description,
        "version": version,
        "isEnabled": isEnabled,
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "password": password,
        "confirmPassword": confirmPassword,
        "roles": roles,
        "userType": userType,
        "addresses": addresses,
        "accountNonExpired": accountNonExpired,
        "accountNonLocked": accountNonLocked,
        "credentialsNonExpired": credentialsNonExpired,
        "tokenNonExpired": tokenNonExpired,
      };
}

class Error {
  Error({
    this.id,
    this.message,
    this.description,
  });

  int id;
  String message;
  String description;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        id: json["id"],
        message: json["message"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "description": description,
      };
}
