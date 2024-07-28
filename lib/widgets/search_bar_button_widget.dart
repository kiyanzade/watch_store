import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';

class SearchBarButton extends StatelessWidget {
  final Function() onTap;
  const SearchBarButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.medium),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.searchBar,
            borderRadius: BorderRadius.circular(AppDimens.large),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(Assets.images.mainLogo.path),
              const Text(
                AppStrings.searchProduct,
                style: TextStyle(color: AppColors.hint, fontSize: 14),
              ),
              Padding(
                padding: const EdgeInsets.all(AppDimens.small),
                child: SvgPicture.asset(Assets.images.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
