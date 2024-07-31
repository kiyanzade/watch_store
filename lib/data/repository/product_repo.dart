import 'package:watch_store_app/data/model/product_model.dart';
import 'package:watch_store_app/data/src/product_data_source.dart';

abstract class IProductRepo {
  Future<List<ProductModel>> getAllByCategory(int id);
  Future<List<ProductModel>> getAllByBrand(int id);
  Future<List<ProductModel>> getSorted(String routeParam);
  Future<List<ProductModel>> searchProducts(String searchKey);
}

class ProductRepository extends IProductRepo {
  final IProductDataSource _productDataSource;

  ProductRepository(this._productDataSource);

  @override
  Future<List<ProductModel>> getAllByBrand(int id) =>
      _productDataSource.getAllByBrand(id);

  @override
  Future<List<ProductModel>> getAllByCategory(int id) =>
      _productDataSource.getAllByCategory(id);

  @override
  Future<List<ProductModel>> getSorted(String routeParam) =>
      _productDataSource.getSorted(routeParam);
  @override
  Future<List<ProductModel>> searchProducts(String searchKey) =>
      _productDataSource.searchProducts(searchKey);
}
