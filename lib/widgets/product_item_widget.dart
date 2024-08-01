import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/data/model/product_model.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const ProductWidget({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    final Duration expireTime = DateTime.now()
        .difference(DateTime.parse(productModel.specialExpiration))
        .abs();
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
            productModel.title,
            style: themeData.textTheme.titleLarge,
          ),
          AppDimens.large.heightSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: productModel.discount != 0,
                child: Container(
                  width: 50,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimens.large),
                    color: Colors.red,
                  ),
                  child: Text(
                    '${productModel.discount} %',
                    style: themeData.textTheme.labelMedium,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      '${productModel.discountPrice.toString().seRagham()} تومان'),
                  Visibility(
                    visible: productModel.price != 0,
                    child: Text(
                      productModel.price.toString().seRagham(),
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
            visible: expireTime.inSeconds != 0,
            child: Column(
              children: [
                const Divider(
                  color: AppColors.primaryColor,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: TimerCountdown(
                    spacerWidth: 1,
                    enableDescriptions: false,
                    format: CountDownTimerFormat.daysHoursMinutesSeconds,
                    timeTextStyle: themeData.textTheme.headlineMedium!
                        .copyWith(fontSize: 14),
                    colonsTextStyle: themeData.textTheme.headlineMedium!
                        .copyWith(fontSize: 14),
                    endTime: DateTime.now().add(expireTime),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
