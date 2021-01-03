class FixJidCategory {
  FixJidCategory({
    this.id,
    this.name,
    this.imageUrl,
    this.hasProduct,
    this.errors,
  });

  int id;
  String name;
  String imageUrl;
  bool hasProduct;
  dynamic errors;

  factory FixJidCategory.fromJson(Map<String, dynamic> json) => FixJidCategory(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        hasProduct: json["hasProduct"],
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "hasProduct": hasProduct,
        "errors": errors,
      };
}
