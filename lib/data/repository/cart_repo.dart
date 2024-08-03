import 'package:watch_store_app/data/config/remote_config.dart';
import 'package:watch_store_app/data/model/cart_model.dart';
import 'package:watch_store_app/data/src/cart_data_source.dart';

final ICartRepository cartRepository =
    CartRepository(CartRemoteDataSource(DioManager.dio));

abstract class ICartRepository {
  Future<CartModel> getUserCart();
  Future<String> cartPayment();
  Future<CartModel> addToCart(int productId);
  Future<CartModel> removeFromCart(int productId);
  Future<CartModel> deleteFromCart(int productId);
}

class CartRepository extends ICartRepository {
  final ICartDataSource dataSource;

  CartRepository(this.dataSource);

  @override
  Future<CartModel> addToCart(int productId) async =>
      await dataSource.addToCart(productId);

  @override
  Future<CartModel> deleteFromCart(int productId) async =>
      await dataSource.deleteFromCart(productId);
  @override
  Future<CartModel> getUserCart() async => await dataSource.getUserCart();

  @override
  Future<CartModel> removeFromCart(int productId) async =>
      await dataSource.removeFromCart(productId);

  @override
  Future<String> cartPayment() async => await dataSource.cartPayment();
}
