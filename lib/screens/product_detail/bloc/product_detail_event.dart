part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

final class ProductDetailInitialEvent extends ProductDetailEvent {
  final int productId;

  const ProductDetailInitialEvent(this.productId);
}