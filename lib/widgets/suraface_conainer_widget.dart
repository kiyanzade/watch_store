import 'package:flutter/material.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';

class SurfaceContainer extends StatelessWidget {
  const SurfaceContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
          AppDimens.medium, AppDimens.medium, AppDimens.medium, 0),
      padding: const EdgeInsets.all(AppDimens.medium),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.medium),
          color: AppColors.surfaceColor),
      child: child,
    );
  }
}
