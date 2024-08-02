import 'package:dio/dio.dart';
import 'package:watch_store_app/data/constants.dart';
import 'package:watch_store_app/data/model/cart_model.dart';
import 'package:watch_store_app/utils/response_validator.dart';

abstract class ICartDataSource {
  Future<CartModel> getUserCart();
  Future<CartModel> addToCart(int productId);
  Future<CartModel> removeFromCart(int productId);
  Future<CartModel> deleteFromCart(int productId);
}

class CartRemoteDataSource extends ICartDataSource {
  final Dio httpClient;

  CartRemoteDataSource(this.httpClient);
  @override
  Future<CartModel> addToCart(int productId) async {
     final CartModel cart;
    final Response<String> response = await httpClient
        .post('${baseUrl}add_to_cart', data: {'product_id': productId});
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
       cart = cartModelFromJson(response.data!);
    return cart;
  }

  @override
  Future<CartModel> deleteFromCart(int productId) async {
     final CartModel cart;
  final Response<String> response = await httpClient
        .post('${baseUrl}delete_from_cart', data: {'product_id': productId});
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
       cart = cartModelFromJson(response.data!);
    return cart;
  }

  @override
  Future<CartModel> getUserCart() async {
    
    final CartModel cart;
    final Response<String> response = await httpClient.post('${baseUrl}user_cart');
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    cart = cartModelFromJson(response.data!);
    return cart;
  }

  @override
  Future<CartModel> removeFromCart(int productId) async {
     final CartModel cart;
     final Response<String> response = await httpClient
        .post('${baseUrl}remove_from_cart', data: {'product_id': productId});
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
       cart = cartModelFromJson(response.data!);
    return cart;
  }
}
