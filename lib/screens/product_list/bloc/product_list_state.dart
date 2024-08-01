part of 'product_list_bloc.dart';

sealed class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object> get props => [];
}


final class ProductListErrorState extends ProductListState {
  final String errorMessage;
  const ProductListErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class ProductListLoadingState extends ProductListState {}
final class ProductListEmptyState extends ProductListState {}

final class ProductListSuccessState extends ProductListState {
  final List<ProductModel> products;
  const ProductListSuccessState(this.products);

  @override
  List<Object> get props => [products];
}
