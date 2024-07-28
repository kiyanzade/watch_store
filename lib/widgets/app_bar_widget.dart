import 'package:flutter/material.dart';
import 'package:watch_store_app/res/colors.dart';

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
