import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/widgets/app_slider_widget.dart';
import 'package:watch_store_app/widgets/cat_widget.dart';
import 'package:watch_store_app/widgets/product_item_widget.dart';
import 'package:watch_store_app/widgets/search_bar_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarButton(onTap: () {}),
            const AppSliderWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CatWidget(
                  title: AppStrings.classic,
                  iconPath: Assets.images.clasic,
                  ontap: () {},
                  colors: AppColors.catClasicColors,
                ),
                CatWidget(
                  title: AppStrings.smart,
                  iconPath: Assets.images.smart,
                  ontap: () {},
                  colors: AppColors.catSmartColors,
                ),
                CatWidget(
                  title: AppStrings.digital,
                  iconPath: Assets.images.digital,
                  ontap: () {},
                  colors: AppColors.catDigitalColors,
                ),
                CatWidget(
                  title: AppStrings.desktop,
                  iconPath: Assets.images.desktop,
                  ontap: () {},
                  colors: AppColors.catDesktopColors,
                ),
              ],
            ),
            AppDimens.large.heightSizedBox,
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 9,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return const VerticalText();
                  }
                  return const ProductWidget(
                    discount: 20,
                    productName: 'ساعت مردانه نیوفورس',
                    price: '120000',
                    time: 1522,
                    oldPrice: '250000',
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(AppStrings.viewAll),
                4.widthSizedBox,
                Transform.rotate(
                    angle: 1.55, child: SvgPicture.asset(Assets.images.back)),
              ],
            ),
            4.heightSizedBox,
            Text(
              AppStrings.amazing,
              style: themeData.textTheme.titleLarge!
                  .copyWith(color: AppColors.amazingColor, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
