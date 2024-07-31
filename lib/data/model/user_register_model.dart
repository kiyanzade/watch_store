import 'dart:convert';

import 'package:dio/dio.dart';

UserRegisterModel userRegisterModelFromJson(String str) =>
    UserRegisterModel.fromJson(json.decode(str));

String userRegisterModelToJson(UserRegisterModel data) =>
    json.encode(data.toJson());

class UserRegisterModel {
  String name;

  String phone;
  MultipartFile image;
  String address;
  double lat;
  double lng;
  String postalCode;

  UserRegisterModel({
    required this.name,
    required this.phone,
    required this.image,
    required this.address,
    required this.lat,
    required this.lng,
    required this.postalCode,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      UserRegisterModel(
        name: json["name"],
        phone: json["phone"],
        image: json["image"],
        address: json["address"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "image": image,
        "address": address,
        "lat": lat,
        "lng": lng,
        "postal_code": postalCode,
      };
}
