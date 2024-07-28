import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';

class BtmNavActiveItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  void Function() onTap;

   BtmNavActiveItem(
      {super.key,
      required this.iconPath,
      required this.label,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                  isActive
                      ? AppColors.btmNavActiveItem
                      : AppColors.btmNavInActiveItem,
                  BlendMode.srcIn),
            ),
            AppDimens.small.heightSizedBox,
            Text(
              label,
              style: themeData.textTheme.labelSmall!.copyWith(
                color: isActive
                    ? AppColors.btmNavActiveItem
                    : AppColors.btmNavInActiveItem,
              ),
            )
          ],
        ),
      ),
    );
  }
}
