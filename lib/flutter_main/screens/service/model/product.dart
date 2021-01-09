class Product {
  Product({
    this.id,
    this.name,
    this.imageUrl,
    this.price,
    this.description,
    this.errors,
    this.isDefault
  });

  int id;
  String name;
  String imageUrl;
  int price;
  dynamic description;
  dynamic errors;
  int productCartCount=0;
  bool isDefault = false;
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    price: json["price"],
    description: json["description"],
    errors: json["errors"],
    isDefault: json["default"]??false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageUrl": imageUrl,
    "price": price,
    "description": description,
    "errors": errors,
  };
}
