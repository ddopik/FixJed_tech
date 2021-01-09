import 'package:flutter_base_app/flutter_main/screens/service/model/product.dart';

class FixJedCategory {
  FixJedCategory({
    this.id,
    this.name,
    this.imageUrl,
    this.hasProduct,
    this.description,
    this.totalPrice,
    this.products,
    this.errors,
  });

  int id;
  String name;
  String imageUrl;
  bool hasProduct;
  dynamic description;
  int totalPrice;
  List<Product> products;
  dynamic errors;

  factory FixJedCategory.fromJson(Map<String, dynamic> json) => FixJedCategory(
    id: json["id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    hasProduct: json["hasProduct"],
    description: json["description"],
    totalPrice: json["totalPrice"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageUrl": imageUrl,
    "hasProduct": hasProduct,
    "description": description,
    "totalPrice": totalPrice,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "errors": errors,
  };
}
