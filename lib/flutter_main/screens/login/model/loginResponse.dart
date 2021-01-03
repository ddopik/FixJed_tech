class LoginResponse {
  LoginResponse({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.userType,
    this.addresses,
    this.roles,
  });

  int id;
  String token ;
  String username;
  String firstName;
  String lastName;
  String email;
  String phone;
  UserType userType;
  List<dynamic> addresses;
  List<Role> roles;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    id: json["id"],
    username: json["username"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    userType: UserType.fromJson(json["userType"]),
    addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "userType": userType.toJson(),
    "addresses": List<dynamic>.from(addresses.map((x) => x)),
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}

class Role {
  Role({
    this.id,
    this.name,
    this.permissions,
  });

  int id;
  String name;
  List<UserType> permissions;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    permissions: List<UserType>.from(json["permissions"].map((x) => UserType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "permissions": List<dynamic>.from(permissions.map((x) => x.toJson())),
  };
}

class UserType {
  UserType({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory UserType.fromJson(Map<String, dynamic> json) => UserType(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
