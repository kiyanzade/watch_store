import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:watch_store_app/data/constants.dart';
import 'package:watch_store_app/data/model/product_model.dart';
import 'package:watch_store_app/utils/response_validator.dart';

abstract class IProductDataSource {
  Future<List<ProductModel>> getAllByCategory(int id);
  Future<List<ProductModel>> getAllByBrand(int id);
  Future<List<ProductModel>> getSorted(String routeParam);
  Future<List<ProductModel>> searchProducts(String searchKey);
}

class RemoteProductDataSource extends IProductDataSource {
  final Dio httpClient;

  RemoteProductDataSource({required this.httpClient});

  @override
  Future<List<ProductModel>> getAllByBrand(int id) async {
    List<ProductModel> products = <ProductModel>[];

    final response = await httpClient.get("${baseUrl}products_by_brand/$id");
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);

    for (var elemnt in (response.data['products_by_brands']['data'] as List)) {
      products.add(productModelFromJson(elemnt));
    }

    return products;
  }

  @override
  Future<List<ProductModel>> getAllByCategory(int id) async {
    List<ProductModel> products = <ProductModel>[];

    final response = await httpClient.get("${baseUrl}products_by_category/$id");
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);

    for (var elemnt
        in (response.data['products_by_category']['data'] as List)) {
      products.add(productModelFromJson(json.encode(elemnt))); // TODO fix fromJson in model
    }

    return products;
  }

  @override
  Future<List<ProductModel>> getSorted(String routeParam) async {
    List<ProductModel> products = <ProductModel>[];

    final response = await httpClient.get(baseUrl + routeParam);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);

    for (var elemnt in (response.data['all_products']['data'] as List)) {
      products.add(productModelFromJson(elemnt));
    }

    return products;
  }

  @override
  Future<List<ProductModel>> searchProducts(String searchKey) async {
    List<ProductModel> products = <ProductModel>[];

    final response = await httpClient.get("${baseUrl}all_products/$searchKey");
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);

    for (var elemnt in (response.data['all_products']['data'] as List)) {
      products.add(productModelFromJson(elemnt));
    }

    return products;
  }
}
