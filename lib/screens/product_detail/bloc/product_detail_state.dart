part of 'product_detail_bloc.dart';

sealed class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

final class ProductDetailLoadingState extends ProductDetailState {}

final class ProductDetailErrorState extends ProductDetailState {
  final String errorMessage;

  const ProductDetailErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

final class ProductDetailSuccessState extends ProductDetailState {
  final ProductDetailModel productDetail;

  const ProductDetailSuccessState(this.productDetail);
  @override
  List<Object> get props => [productDetail];
}
