import 'package:flutter/material.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/routes/screen_names.dart';
import 'package:watch_store_app/widgets/elevated_buttom_widget.dart';
import 'package:watch_store_app/widgets/text_field_widget.dart';

class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              TextFieldWidget(
                controller: TextEditingController(),
                hint: AppStrings.hintPhoneNumber,
                title: AppStrings.enterYourNumber,
              ),
              AppDimens.large.heightSizedBox,
              ElevatedButtomWidget(
                title: AppStrings.sendOtpCode,
                onPressed: () {
                  Navigator.pushNamed(context, ScreenNames.verifyOtpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
