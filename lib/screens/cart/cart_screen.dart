import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/data/model/cart_model.dart';
import 'package:watch_store_app/data/model/cart_model.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/screens/cart/bloc/cart_bloc.dart';
import 'package:watch_store_app/widgets/app_bar_widget.dart';
import 'package:watch_store_app/widgets/elevated_buttom_widget.dart';
import 'package:watch_store_app/widgets/shopping_cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);
    BlocProvider.of<CartBloc>(context).add(CartInitialEvent());
    return Scaffold(
      appBar: appBarWidget(AppStrings.basket),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimens.medium),
            margin: const EdgeInsets.all(AppDimens.medium),
            decoration: BoxDecoration(
              color: AppColors.mainBg,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow.withOpacity(0.1),
                  blurRadius: 5,
                )
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(AppDimens.medium),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.sendToAddress,
                        style: themeData.textTheme.titleMedium,
                      ),
                      4.heightSizedBox,
                      Text(
                        "آدرس آدرس آدرس آدرس آدرس آدرسآدرس آدرس آدرسآدرس آدرس آدرسآدرس آدرس آدرس",
                        style: themeData.textTheme.titleLarge!
                            .copyWith(fontSize: 15),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CartErrorState) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                } else if (state is CartSuccessLoadState) {
                  return ListView.builder(
                    itemCount: state.cartModel.data.userCart.length,
                    itemBuilder: (context, index) {
                      final UserCart userCart =
                          state.cartModel.data.userCart[index];
                      return ShoppingCartItemWidget(
                        cartItem: userCart,
                      );
                    },
                  );
                } else if (state is CartDeletedState) {
                  return ListView.builder(
                    itemCount: state.cartModel.data.userCart.length,
                    itemBuilder: (context, index) {
                      final UserCart userCart =
                          state.cartModel.data.userCart[index];
                      return ShoppingCartItemWidget(
                        cartItem: userCart,
                      );
                    },
                  );
                } else if (state is CartRemovedState) {
                  return ListView.builder(
                    itemCount: state.cartModel.data.userCart.length,
                    itemBuilder: (context, index) {
                      final UserCart userCart =
                          state.cartModel.data.userCart[index];
                      return ShoppingCartItemWidget(
                        cartItem: userCart,
                      );
                    },
                  );
                } else if (state is CartAddedState) {
                  return ListView.builder(
                    itemCount: state.cartModel.data.userCart.length,
                    itemBuilder: (context, index) {
                      final UserCart userCart =
                          state.cartModel.data.userCart[index];
                      return ShoppingCartItemWidget(
                        cartItem: userCart,
                      );
                    },
                  );
                } else {
                  return ElevatedButtomWidget(
                    title: const Text("تلاش مجدد"),
                    onPressed: () => BlocProvider.of<CartBloc>(context)
                        .add(CartInitialEvent()),
                  );
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppDimens.medium),
            color: Colors.grey.withOpacity(0.009),
            // height: size.height * 0.08,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "ادامه فرایند خرید",
                    style: themeData.textTheme.labelMedium,
                  ),
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CartErrorState) {
                      return Text(state.errorMessage);
                    } else if (state is CartSuccessLoadState) {
                      return Text(
                        "مجموع: ${state.cartModel.data.cartTotalPrice.toString().seRagham()} تومان",
                        style: themeData.textTheme.titleLarge,
                      );
                    } else if (state is CartAddedState) {
                      return Text(
                        "مجموع: ${state.cartModel.data.cartTotalPrice.toString().seRagham()} تومان",
                        style: themeData.textTheme.titleLarge,
                      );
                    } else if (state is CartDeletedState) {
                      return Text(
                        "مجموع: ${state.cartModel.data.cartTotalPrice.toString().seRagham()} تومان",
                        style: themeData.textTheme.titleLarge,
                      );
                    } else if (state is CartRemovedState) {
                      return Text(
                        "مجموع: ${state.cartModel.data.cartTotalPrice.toString().seRagham()} تومان",
                        style: themeData.textTheme.titleLarge,
                      );
                    } else {
                      return const Text('');
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
