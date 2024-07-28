import 'package:flutter/material.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/routes/screen_names.dart';
import 'package:watch_store_app/widgets/app_bar_widget.dart';
import 'package:watch_store_app/widgets/elevated_buttom_widget.dart';
import 'package:watch_store_app/widgets/text_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget(AppStrings.register),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                AppDimens.large.heightSizedBox,
                CircleAvatar(
                  maxRadius: 45,
                  backgroundImage: AssetImage(Assets.images.avatarPng.path),
                ),
                AppDimens.small.heightSizedBox,
                const Text(
                  AppStrings.chooseProfileImage,
                ),
                AppDimens.medium.heightSizedBox,
                TextFieldWidget(
                  title: AppStrings.nameLastName,
                  hint: AppStrings.hintNameLastName,
                  controller: TextEditingController(),
                ),
                AppDimens.medium.heightSizedBox,
                TextFieldWidget(
                  title: AppStrings.homeNumber,
                  hint: AppStrings.hintHomeNumber,
                  controller: TextEditingController(),
                ),
                AppDimens.medium.heightSizedBox,
                TextFieldWidget(
                  title: AppStrings.address,
                  hint: AppStrings.hintAddress,
                  controller: TextEditingController(),
                ),
                AppDimens.medium.heightSizedBox,
                TextFieldWidget(
                  title: AppStrings.postalCode,
                  hint: AppStrings.hintPostalCode,
                  controller: TextEditingController(),
                ),
                AppDimens.medium.heightSizedBox,
                TextFieldWidget(
                  title: AppStrings.location,
                  hint: AppStrings.hintLocation,
                  controller: TextEditingController(),
                  icon: const Icon(Icons.location_on_outlined),
                ),
                AppDimens.large.heightSizedBox,
                ElevatedButtomWidget(
                  title: AppStrings.register,
                  onPressed: () {
                    Navigator.pushNamed(context, ScreenNames.mainScreen);
                  },
                ),
                AppDimens.large.heightSizedBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
