

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    CartData data;

    CartModel({
        required this.data,
    });

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        data: CartData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class CartData {
    List<UserCart> userCart;
    int cartTotalPrice;
    int totalWithoutDiscountPrice;

    CartData({
        required this.userCart,
        required this.cartTotalPrice,
        required this.totalWithoutDiscountPrice,
    });

    factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        userCart: List<UserCart>.from(json["user_cart"].map((x) => UserCart.fromJson(x))),
        cartTotalPrice: json["cart_total_price"],
        totalWithoutDiscountPrice: json["total_without_discount_price"],
    );

    Map<String, dynamic> toJson() => {
        "user_cart": List<dynamic>.from(userCart.map((x) => x.toJson())),
        "cart_total_price": cartTotalPrice,
        "total_without_discount_price": totalWithoutDiscountPrice,
    };
}

class UserCart {
    int id;
    int productId;
    String product;
    int count;
    int price;
    int discount;
    int discountPrice;
    String image;
    bool countLoading;

    UserCart({
        required this.id,
        required this.productId,
        required this.product,
        required this.count,
        required this.price,
        required this.discount,
        required this.discountPrice,
        required this.image,
        this.countLoading = false,
    });

    factory UserCart.fromJson(Map<String, dynamic> json) => UserCart(
        id: json["id"],
        productId: json["product_id"],
        product: json["product"],
        count: json["count"],
        price: json["price"],
        discount: json["discount"],
        discountPrice: json["discount_price"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product": product,
        "count": count,
        "price": price,
        "discount": discount,
        "discount_price": discountPrice,
        "image": image,
    };
}
