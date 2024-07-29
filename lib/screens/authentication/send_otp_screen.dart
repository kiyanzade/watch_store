import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/routes/screen_names.dart';
import 'package:watch_store_app/screens/authentication/cubit/auth_cubit.dart';
import 'package:watch_store_app/widgets/elevated_buttom_widget.dart';
import 'package:watch_store_app/widgets/text_field_widget.dart';

class SendOtpScreen extends StatelessWidget {
  SendOtpScreen({super.key});

  final TextEditingController _phoneNumberController = TextEditingController();

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
              TextFieldWidget(
                controller: _phoneNumberController,
                hint: AppStrings.hintPhoneNumber,
                title: AppStrings.enterYourNumber,
              ),
              AppDimens.large.heightSizedBox,

/**
 * BlocBiulder -> change widget
 * BlocListener -> do anythings
 * BlocConsumer -> both
 */

              BlocConsumer<AuthCubit, AuthState>(
                builder: (context, state) {
                  return ElevatedButtomWidget(
                    title: (state is AuthLoadingState)
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            AppStrings.sendOtpCode,
                            style: themeData.textTheme.labelMedium,
                          ),
                    onPressed: (state is AuthLoadingState)
                        ? () {}
                        : () {
                            BlocProvider.of<AuthCubit>(context)
                                .sendSms(_phoneNumberController.text);
                          },
                  );
                },
                listener: (BuildContext context, AuthState state) {
                  if (state is AuthSentCodeState) {
                    Navigator.pushNamed(context, ScreenNames.verifyOtpScreen,
                        arguments: state.phoneNumber);
                  } else if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1),
                        backgroundColor: Colors.red,
                        content: Text(state.error),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
