class FixJidService {
  FixJidService({
    this.id,
    this.name,
    this.imageUrl,
    this.hasProduct,
    this.errors,
    this.description,
  });

  int id;
  String name;
  String imageUrl;
  bool hasProduct;
  dynamic errors;
  String description;

  factory FixJidService.fromJson(Map<String, dynamic> json) => FixJidService(
    id: json["id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    hasProduct: json["hasProduct"] == null ? null : json["hasProduct"],
    errors: json["errors"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageUrl": imageUrl,
    "hasProduct": hasProduct == null ? null : hasProduct,
    "errors": errors,
    "description": description,
  };
}