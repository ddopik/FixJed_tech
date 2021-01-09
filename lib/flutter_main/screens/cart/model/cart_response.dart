import 'package:flutter_base_app/flutter_main/screens/main_category/model/fixjid_category.dart';

class CartResponse {
  CartResponse({
    this.cartTotalProductsCount,
    this.cartTotalPrice,
    this.cartProductCount,
    this.categories,
    this.errors,
  });

  int cartTotalProductsCount;
  int cartTotalPrice;
  int cartProductCount;
  List<FixJedCategory> categories;
  dynamic errors;

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
    cartTotalProductsCount: json["cartTotalProductsCount"],
    cartTotalPrice: json["cartTotalPrice"],
    cartProductCount: json["cartProductCount"],
    categories: List<FixJedCategory>.from(json["categories"].map((x) => FixJedCategory.fromJson(x))),
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "cartTotalProductsCount": cartTotalProductsCount,
    "cartTotalPrice": cartTotalPrice,
    "cartProductCount": cartProductCount,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "errors": errors,
  };
}