import 'package:dio/dio.dart';
import 'package:watch_store_app/data/model/cart_model.dart';
import 'package:watch_store_app/utils/response_validator.dart';

abstract class ICartDataSource {
  Future<CartModel> getUserCart();
  Future<void> addToCart(int productId);
  Future<void> removeFromCart(int productId);
  Future<void> deleteFromCart(int productId);
}

class CartRemoteDataSource extends ICartDataSource {
  final Dio httpClient;

  CartRemoteDataSource(this.httpClient);
  @override
  Future<void> addToCart(int productId) async {
    final response =
        await httpClient.post('add_to_cart', data: {'product_id': productId});
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
  }

  @override
  Future<void> deleteFromCart(int productId) async {
    final response = await httpClient
        .post('delete_from_cart', data: {'product_id': productId});
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
  }

  @override
  Future<CartModel> getUserCart() async {
    final CartModel cart;
    final Response<String> response = await httpClient.post('user_cart');
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    cart = cartModelFromJson(response.data!);
    return cart;
  }

  @override
  Future<void> removeFromCart(int productId) async {
    final response = await httpClient
        .post('remove_from_cart', data: {'product_id': productId});
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
  }
}
