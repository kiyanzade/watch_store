import 'package:flutter/material.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';

ThemeData lightThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Vazir',
  primaryColor: AppColors.primaryColor,
  iconTheme: const IconThemeData(color: Colors.black),
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    hintStyle: TextStyle(color: AppColors.hint, fontSize: 14),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppDimens.medium),
      ),
      borderSide: BorderSide(color: AppColors.focusedBorderColor),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppDimens.medium),
      ),
      borderSide: BorderSide(color: AppColors.borderColor),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      shape: WidgetStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimens.medium),
          ),
        ),
      ),
    ),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 14),
    titleMedium: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500,fontSize: 14),
    labelMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16),
    labelSmall: TextStyle(color: Colors.black,)
  ),
);
