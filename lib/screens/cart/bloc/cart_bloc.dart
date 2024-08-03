import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store_app/data/model/cart_model.dart';
import 'package:watch_store_app/data/repository/cart_repo.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository cartRepository;
  CartBloc(this.cartRepository) : super(CartInitialState()) {
    on<CartEvent>((event, emit) async {
      try {
        if (event is CartInitialEvent) {
          emit(CartLoadingState());
          final CartModel cart = await cartRepository.getUserCart();
          emit(CartSuccessLoadState(cart));
        } else if (event is CartAddToCartEvent) {
          final CartModel cart =
              await cartRepository.addToCart(event.productId);
          emit(CartAddedState(cart));
        } else if (event is CartDeleteFromCartEvent) {
          final CartModel cart =
              await cartRepository.deleteFromCart(event.productId);
          emit(CartDeletedState(cart));
        } else if (event is CartRemoveFromCartEvent) {
          final CartModel cart =
              await cartRepository.removeFromCart(event.productId);
          emit(CartRemovedState(cart));
        } else if (event is CartPaymentEvent) {
          final String url = await cartRepository.cartPayment();
          emit(CartPaymentSuccessUrlState(url));
        }
      } on Exception catch (e) {
        emit(CartErrorState(e.toString()));
      }
    });
  }
}
