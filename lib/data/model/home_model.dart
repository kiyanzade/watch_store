

import 'dart:convert';

import 'package:watch_store_app/data/model/product_model.dart';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));


class HomeModel {
    HomeData data;

    HomeModel({
        required this.data,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        data: HomeData.fromJson(json["data"]),
    );

   
}

class HomeData {
    List<CategorySlideModel> slides;
    List<CategorySlideModel> categories;
    List<ProductModel> amazingProducts;
    Banner banner;
    List<ProductModel> mostSellerProducts;
    List<ProductModel> newestProducts;

    HomeData({
        required this.slides,
        required this.categories,
        required this.amazingProducts,
        required this.banner,
        required this.mostSellerProducts,
        required this.newestProducts,
    });

    factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
        slides: List<CategorySlideModel>.from(json["sliders"].map((x) => CategorySlideModel.fromJson(x))),
        categories: List<CategorySlideModel>.from(json["categories"].map((x) => CategorySlideModel.fromJson(x))),
        amazingProducts: List<ProductModel>.from(json["amazing_products"].map((x) => ProductModel.fromJson(x))),
        banner: Banner.fromJson(json["banner"]),
        mostSellerProducts: List<ProductModel>.from(json["most_seller_products"].map((x) => ProductModel.fromJson(x))),
        newestProducts: List<ProductModel>.from(json["newest_products"].map((x) => ProductModel.fromJson(x))),
    );

}


   
class Banner {
    int id;
    String title;
    String image;
    DateTime createdAt;
    DateTime updatedAt;

    Banner({
        required this.id,
        required this.title,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class CategorySlideModel {
    int id;
    String title;
    String image;

    CategorySlideModel({
        required this.id,
        required this.title,
        required this.image,
    });

    factory CategorySlideModel.fromJson(Map<String, dynamic> json) => CategorySlideModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
    };
}
