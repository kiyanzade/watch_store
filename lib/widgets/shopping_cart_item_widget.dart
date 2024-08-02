import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/data/model/cart_model.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/screens/cart/bloc/cart_bloc.dart';
import 'package:watch_store_app/widgets/suraface_conainer_widget.dart';

class ShoppingCartItemWidget extends StatefulWidget {
  final UserCart cartItem;

  const ShoppingCartItemWidget({
    super.key,
    required this.cartItem,
  });

  @override
  State<ShoppingCartItemWidget> createState() => _ShoppingCartItemWidgetState();
}

class _ShoppingCartItemWidgetState extends State<ShoppingCartItemWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SurfaceContainer(
        child: Row(
      children: [
        Image.asset(
          Assets.images.unnamed.path,
          height: 110,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cartItem.product,
                style: themeData.textTheme.titleLarge,
              ),
              4.heightSizedBox,
              Text(
                "قیمت  : ${'45000'.toString().seRagham()} تومان",
                style: themeData.textTheme.titleMedium,
              ),
              Visibility(
                visible: true,
                child: Text(
                  "با تخفیف: ${'125000'.toString().seRagham()}  تومان",
                  style: themeData.textTheme.headlineMedium,
                ),
              ),
              const Divider(),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.cartItem.countLoading = true;
                        });
                        BlocProvider.of<CartBloc>(context)
                            .add(CartAddToCartEvent(widget.cartItem.productId));
                      },
                      icon: SvgPicture.asset(Assets.images.plus)),
                  widget.cartItem.countLoading
                      ? const CupertinoActivityIndicator()
                      : Text("عدد ${widget.cartItem.count}"),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.cartItem.countLoading = true;
                        });
                        BlocProvider.of<CartBloc>(context).add(
                            CartRemoveFromCartEvent(widget.cartItem.productId));
                      },
                      icon: SvgPicture.asset(Assets.images.minus)),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.cartItem.countLoading = true;
                        });
                        BlocProvider.of<CartBloc>(context).add(
                            CartDeleteFromCartEvent(widget.cartItem.productId));
                      },
                      icon: SvgPicture.asset(Assets.images.delete)),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
