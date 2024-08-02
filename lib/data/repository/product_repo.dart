import 'package:watch_store_app/data/config/remote_config.dart';
import 'package:watch_store_app/data/model/product_detail_model.dart';
import 'package:watch_store_app/data/model/product_model.dart';
import 'package:watch_store_app/data/src/product_data_source.dart';

final IProductRepo productRepository =
    ProductRepository(RemoteProductDataSource(httpClient: DioManager.dio));

abstract class IProductRepo {
  Future<ProductDetailModel> getProductDetail(int id);

  Future<List<ProductModel>> getAllByCategory(int id);
  Future<List<ProductModel>> getAllByBrand(int id);
  Future<List<ProductModel>> getSorted(String routeParam);
  Future<List<ProductModel>> searchProducts(String searchKey);
}

class ProductRepository extends IProductRepo {
  final IProductDataSource _productDataSource;

  ProductRepository(this._productDataSource);

  @override
  Future<List<ProductModel>> getAllByBrand(int id) async =>
      await _productDataSource.getAllByBrand(id);

  @override
  Future<List<ProductModel>> getAllByCategory(int id) async =>
      await _productDataSource.getAllByCategory(id);

  @override
  Future<List<ProductModel>> getSorted(String routeParam) async =>
      await _productDataSource.getSorted(routeParam);
  @override
  Future<List<ProductModel>> searchProducts(String searchKey) async =>
      await _productDataSource.searchProducts(searchKey);

  @override
  Future<ProductDetailModel> getProductDetail(int id) async =>
      await _productDataSource.getProductDetail(id);
}
