import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/routes/screen_names.dart';
import 'package:watch_store_app/screens/authentication/cubit/auth_cubit.dart';
import 'package:watch_store_app/widgets/elevated_buttom_widget.dart';
import 'package:watch_store_app/widgets/text_field_widget.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({super.key});
  final TextEditingController _codeControllr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final String phoneNumber =
        ModalRoute.of(context)!.settings.arguments as String;
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
                    .replaceFirst(AppStrings.replace, phoneNumber),
                style: themeData.textTheme.bodyMedium,
              ),
              AppDimens.small.heightSizedBox,
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text(
                  AppStrings.wrongNumberEditNumber,
                  style: themeData.textTheme.bodyMedium!
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
              AppDimens.large.heightSizedBox,
              TextFieldWidget(
                controller: _codeControllr,
                hint: AppStrings.hintVerificationCode,
                title: AppStrings.enterVerificationCode,
                keyboardType: TextInputType.number,
                prefixWidget: Directionality(
                  textDirection: TextDirection.ltr,
                  child: TimerCountdown(
                    format: CountDownTimerFormat.minutesSeconds,
                    enableDescriptions: false,
                    spacerWidth: 1,
                    timeTextStyle: themeData.textTheme.bodyMedium!
                        .copyWith(color: AppColors.primaryColor),
                    endTime: DateTime.now().add(
                      const Duration(
                        minutes: 2,
                        seconds: 0,
                      ),
                    ),
                    onEnd: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              AppDimens.large.heightSizedBox,
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthVerifiedRegisteredCodeState) {
                    Navigator.of(context).pushNamed(ScreenNames.mainScreen);
                  } else if (state is AuthVerifiedNotRegisteredCodeState) {
                    Navigator.of(context).pushNamed(ScreenNames.registerScreen);
                  }
                },
                builder: (context, state) {
                  return ElevatedButtomWidget(
                    title: (state is AuthLoadingState)
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            AppStrings.next,
                            style: themeData.textTheme.labelMedium,
                          ),
                    onPressed: (state is AuthLoadingState)
                        ? () {}
                        : () {
                            BlocProvider.of<AuthCubit>(context)
                                .verivyCode(phoneNumber, _codeControllr.text);
                          },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
