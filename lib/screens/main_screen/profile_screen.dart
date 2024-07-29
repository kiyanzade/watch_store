import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/widgets/app_bar_widget.dart';
import 'package:watch_store_app/widgets/suraface_conainer_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return SafeArea(
        child: Scaffold(
      appBar: appBarWidget(
        AppStrings.profile,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.large),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppDimens.large.heightSizedBox,
                ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image.asset(Assets.images.avatarPng.path),
                ),
                AppDimens.medium.heightSizedBox,
                const Text(
                  "صادق کیان زاده",
                ),
                AppDimens.large.heightSizedBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppStrings.activeAddress,
                    style: themeData.textTheme.titleLarge,
                  ),
                ),
                4.heightSizedBox,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppStrings.lurem,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: themeData.textTheme.titleMedium,
                      ),
                    ),
                    AppDimens.medium.widthSizedBox,
                    SvgPicture.asset(Assets.images.leftArrow),
                  ],
                ),
                AppDimens.small.heightSizedBox,
                Container(
                  height: 2,
                  width: double.infinity,
                  color: AppColors.surfaceColor,
                ),
                AppDimens.small.heightSizedBox,
                ProfileItem(
                  svgIcon: Assets.images.user,
                  content: "صادق کیان زاده",
                ),
                ProfileItem(
                  svgIcon: Assets.images.cart,
                  content: "578755554",
                ),
                ProfileItem(
                  svgIcon: Assets.images.phone,
                  content: "09107793789",
                ),
                const SurfaceContainer(child: Text("قوانین"))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.svgIcon,
    required this.content,
  });

  final String svgIcon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.small),
      child: Row(
        children: [
          SvgPicture.asset(svgIcon),
          AppDimens.medium.widthSizedBox,
          Expanded(
            child: Text(
              content,
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
