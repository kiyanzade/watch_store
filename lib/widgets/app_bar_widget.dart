import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/widgets/cart_widget.dart';

AppBar appBarWidget(
  String title,
) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
    ),
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.appbar,
  );
}

AppBar customAppBarWidget({
  required Widget title,
}) {
  return AppBar(
    actions: const [
      CartBadge(count: 2,),
    ],
    leading: IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(Assets.images.close),
    ),
    title: title,
    centerTitle: true,
    elevation: 5,
    surfaceTintColor: Colors.white,
    shadowColor: AppColors.shadow,
    shape: const BeveledRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    ),
    backgroundColor: AppColors.appbar,
  );
}
