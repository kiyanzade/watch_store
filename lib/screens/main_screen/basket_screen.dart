import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/widgets/app_bar_widget.dart';
import 'package:watch_store_app/widgets/shopping_cart_item_widget.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
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
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const ShoppingCartItemWidget(
                  name: "ساعت",
                  price: 125000,
                  oldPrice: 1455000,
                );
              },
            ),
          ),
          Container(
            color: Colors.black,
            height: 100,
            width: 52000,
          )
        ],
      ),
    );
  }
}
