import 'package:watch_store_app/data/config/remote_config.dart';
import 'package:watch_store_app/data/model/cart_model.dart';
import 'package:watch_store_app/data/src/cart_data_source.dart';

final ICartRepository cartRepository =
    CartRepository(CartRemoteDataSource(DioManager.dio));

abstract class ICartRepository {
  Future<CartModel> getUserCart();
  Future<void> addToCart(int productId);
  Future<void> removeFromCart(int productId);
  Future<void> deleteFromCart(int productId);
}

class CartRepository extends ICartRepository {
  final ICartDataSource dataSource;

  CartRepository(this.dataSource);

  @override
  Future<void> addToCart(int productId) async =>
      await dataSource.addToCart(productId);

  @override
  Future<void> deleteFromCart(int productId) async =>
      await dataSource.deleteFromCart(productId);
  @override
  Future<CartModel> getUserCart() async => await dataSource.getUserCart();

  @override
  Future<void> removeFromCart(int productId) async =>
      await dataSource.removeFromCart(productId);
}
