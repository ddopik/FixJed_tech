class City {
  City({
    this.id,
    this.name,
    this.errors,
  });

  int id;
  String name;
  dynamic errors;

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    errors: json["errors"],
  );


}
