
import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    int id;
    String title;
    int price;
    int discount;
    DateTime specialExpiration;
    int discountPrice;
    int productCount;
    String category;
    String brand;
    String image;

    ProductModel({
        required this.id,
        required this.title,
        required this.price,
        required this.discount,
        required this.specialExpiration,
        required this.discountPrice,
        required this.productCount,
        required this.category,
        required this.brand,
        required this.image,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        discount: json["discount"],
        specialExpiration: DateTime.parse(json["special_expiration"]),
        discountPrice: json["discount_price"],
        productCount: json["product_count"],
        category: json["category"],
        brand: json["brand"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "discount": discount,
        "special_expiration": specialExpiration.toIso8601String(),
        "discount_price": discountPrice,
        "product_count": productCount,
        "category": category,
        "brand": brand,
        "image": image,
    };
}
