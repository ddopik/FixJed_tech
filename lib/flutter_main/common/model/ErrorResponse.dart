

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
