part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class CartInitialEvent extends CartEvent {}
final class CartPaymentEvent extends CartEvent {}

final class CartAddToCartEvent extends CartEvent {
  final int productId;
  const CartAddToCartEvent(this.productId);
}

final class CartRemoveFromCartEvent extends CartEvent {
  final int productId;

  const CartRemoveFromCartEvent(this.productId);
}

final class CartDeleteFromCartEvent extends CartEvent {
  final int productId;

  const CartDeleteFromCartEvent(this.productId);
}