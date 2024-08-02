import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/data/model/product_model.dart';
import 'package:watch_store_app/data/repository/cart_repo.dart';
import 'package:watch_store_app/data/repository/product_repo.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/screens/cart/bloc/cart_bloc.dart';
import 'package:watch_store_app/screens/product_detail/bloc/product_detail_bloc.dart';
import 'package:watch_store_app/screens/product_detail/product_detail_screen.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ProductDetailBloc(productRepository)
              ..add(ProductDetailInitialEvent(productModel.id)),
            child: const ProductDetailScreen(),
          ),
        ));
      },
      child: Container(
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
            Align(
              alignment: Alignment.center,
              child: Image.network(
                productModel.image,
                height: 100,
              ),
            ),
            AppDimens.medium.heightSizedBox,
            Expanded(
              child: Text(
                productModel.title,
                style: themeData.textTheme.titleLarge,
              ),
            ),
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
                      visible: productModel.discount != 0,
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
              visible: productModel.discount != 0,
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
      ),
    );
  }
}
