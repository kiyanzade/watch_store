// To parse this JSON data, do
//
//     final productDetail = productDetailFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));


class ProductDetailModel {
    ProductDetailData data;

    ProductDetailModel({
        required this.data,
    });

    factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
        data: ProductDetailData.fromJson(json["data"][0]),
    );

   
}

class ProductDetailData {
    int id;
    String title;
    String titleEn;
    int price;
    int discount;
    int discountPrice;
    String guaranty;
    int productCount;
    String category;
    int categoryId;
    List<Color> colors;
    String brand;
    int brandId;
    int review;
    String image;
    List<Property> properties;
    String description;
    String discussion;
    List<Comment> comments;

    ProductDetailData({
        required this.id,
        required this.title,
        required this.titleEn,
        required this.price,
        required this.discount,
        required this.discountPrice,
        required this.guaranty,
        required this.productCount,
        required this.category,
        required this.categoryId,
        required this.colors,
        required this.brand,
        required this.brandId,
        required this.review,
        required this.image,
        required this.properties,
        required this.description,
        required this.discussion,
        required this.comments,
    });

    factory ProductDetailData.fromJson(Map<String, dynamic> json) => ProductDetailData(
        id: json["id"],
        title: json["title"],
        titleEn: json["title_en"],
        price: json["price"],
        discount: json["discount"],
        discountPrice: json["discount_price"],
        guaranty: json["guaranty"],
        productCount: json["product_count"],
        category: json["category"],
        categoryId: json["category_id"],
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
        brand: json["brand"],
        brandId: json["brand_id"],
        review: json["review"],
        image: json["image"],
        properties: List<Property>.from(json["properties"].map((x) => Property.fromJson(x))),
        description: json["description"],
        discussion: json["discussion"],
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "title_en": titleEn,
        "price": price,
        "discount": discount,
        "discount_price": discountPrice,
        "guaranty": guaranty,
        "product_count": productCount,
        "category": category,
        "category_id": categoryId,
        "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
        "brand": brand,
        "brand_id": brandId,
        "review": review,
        "image": image,
        "properties": List<dynamic>.from(properties.map((x) => x.toJson())),
        "description": description,
        "discussion": discussion,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    };
}

class Color {
    String title;
    String code;

    Color({
        required this.title,
        required this.code,
    });

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        title: json["title"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "code": code,
    };
}

class Comment {
    String user;
    String body;

    Comment({
        required this.user,
        required this.body,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        user: json["user"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "body": body,
    };
}

class Property {
    String property;
    String value;

    Property({
        required this.property,
        required this.value,
    });

    factory Property.fromJson(Map<String, dynamic> json) => Property(
        property: json["property"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "property": property,
        "value": value,
    };
}
