import 'package:flutter_base_app/flutter_main/screens/service/model/product.dart';

class CartResponse {
  CartResponse({
    this.id,
    this.count,
    this.product,
  });

  int id;
  int count;
  Product product;

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        id: json["id"],
        count: json["count"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "product": product.toJson(),
      };
}


