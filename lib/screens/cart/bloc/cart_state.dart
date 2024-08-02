part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];

}

final class CartInitialState extends CartState {}

final class CartLoadingState extends CartState {}

final class CartErrorState extends CartState {
  final String errorMessage;

  const CartErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class CartSuccessLoadState extends CartState {
  final CartModel cartModel;

  const CartSuccessLoadState(this.cartModel);
  @override
  List<Object> get props => [cartModel];
}

final class CartRemovedState extends CartState {
  final CartModel cartModel;

  const CartRemovedState(this.cartModel);
  @override
  List<Object> get props => [cartModel];
  
}

final class CartDeletedState extends CartState {
  final CartModel cartModel;

  const CartDeletedState(this.cartModel);
  @override
  List<Object> get props => [cartModel];
}

final class CartAddedState extends CartState {
  final CartModel cartModel;

  const CartAddedState(this.cartModel);
  @override
  List<Object> get props => [cartModel];
}
