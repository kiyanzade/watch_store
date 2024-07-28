import 'package:flutter/material.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/routes/screen_names.dart';
import 'package:watch_store_app/widgets/elevated_buttom_widget.dart';
import 'package:watch_store_app/widgets/text_field_widget.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.mainLogo.path,
              ),
              (AppDimens.large * 2).heightSizedBox,
              Text(
                AppStrings.otpCodeSendFor
                    .replaceFirst(AppStrings.replace, '09107793789'),
                style: themeData.textTheme.bodyMedium,
              ),
              AppDimens.small.heightSizedBox,
              Text(
                AppStrings.wrongNumberEditNumber,
                style: themeData.textTheme.bodyMedium!
                    .copyWith(color: AppColors.primaryColor),
              ),
              AppDimens.large.heightSizedBox,
              TextFieldWidget(
                controller: TextEditingController(),
                hint: AppStrings.hintVerificationCode,
                title: AppStrings.enterVerificationCode,
                keyboardType: TextInputType.number,
                prefixTitle: '2:32',
                textAlign: TextAlign.center,
              ),
              AppDimens.large.heightSizedBox,
              ElevatedButtomWidget(
                title: AppStrings.next,
                onPressed: () {
                  Navigator.pushNamed(context, ScreenNames.registerScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
