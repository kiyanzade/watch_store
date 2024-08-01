import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/data/model/product_model.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/widgets/app_bar_widget.dart';
import 'package:watch_store_app/widgets/product_item_widget.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarWidget(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.images.sort),
            AppDimens.medium.widthSizedBox,
            const Text('پرفروش ترین ها'),
          ],
        ),
      ),
      body: Column(
        children: [
          AppDimens.medium.heightSizedBox,
          const TagList(),
          // Expanded(
          //   child: GridView.builder(
          //     itemCount: 10,
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 4,
          //       childAspectRatio: 0.7,
          //     ),
          //     itemBuilder: (context, index) {
          //       return const ProductWidget(productModel: null,
          //           );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.medium),
      child: SizedBox(
        height: 24,
        child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: AppDimens.small),
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.small),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(AppDimens.large)),
                child: Text(
                  "نیوفورس",
                  style: themeData.textTheme.labelMedium!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              );
            }),
      ),
    );
  }
}
