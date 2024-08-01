part of 'product_list_bloc.dart';

sealed class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

final class ProductListInitialEvent extends ProductListEvent {
  final int param;
  const ProductListInitialEvent(this.param);

  @override
  List<Object> get props => [param];
}