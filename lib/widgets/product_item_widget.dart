import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';

class ProductWidget extends StatelessWidget {
  final String productName;
  final String price;
  final String oldPrice;
  final int discount;
  final int time;
  const ProductWidget({
    super.key,
    this.discount = 0,
    required this.productName,
    required this.price,
    this.time = 0,
    this.oldPrice = '0',
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      width: 200,
      height: 298,
      margin: const EdgeInsets.all(AppDimens.medium),
      padding: const EdgeInsets.all(AppDimens.medium),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.medium)),
        gradient: LinearGradient(
          colors: AppColors.productBgGradiant,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
                alignment: Alignment.center,
                child: Image.asset(Assets.images.unnamed.path)),
          ),
          AppDimens.medium.heightSizedBox,
          Text(
            productName,
            style: themeData.textTheme.titleLarge,
          ),
          AppDimens.large.heightSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: discount != 0,
                child: Container(
                  width: 50,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimens.large),
                    color: Colors.red,
                  ),
                  child: Text(
                    '$discount %',
                    style: themeData.textTheme.labelMedium,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${price.seRagham()} تومان'),
                  Visibility(
                    visible: oldPrice != '0',
                    child: Text(
                      oldPrice.seRagham(),
                      style: themeData.textTheme.titleMedium!.copyWith(
                          color: Colors.black54,
                          decoration: TextDecoration.lineThrough),
                    ),
                  )
                ],
              )
            ],
          ),
          AppDimens.medium.heightSizedBox,
          Visibility(
            visible: time != 0,
            child: Column(
              children: [
                const Divider(
                  color: AppColors.primaryColor,
                ),
                Text(
                  time.toString(),
                  style: themeData.textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
