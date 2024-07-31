import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store_app/components/extensions.dart';
import 'package:watch_store_app/data/model/user_register_model.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/dimens.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/routes/screen_names.dart';
import 'package:watch_store_app/screens/register/cubit/register_cubit.dart';
import 'package:watch_store_app/utils/image_handler.dart';
import 'package:watch_store_app/widgets/app_bar_widget.dart';
import 'package:watch_store_app/widgets/elevated_buttom_widget.dart';
import 'package:watch_store_app/widgets/text_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerNameLastName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  final TextEditingController _controllerPostalCode = TextEditingController();
  final TextEditingController _controllerLocation = TextEditingController();
  final ImageHandler imageHandler = ImageHandler();
  double lat = 0;
  double lng = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget(AppStrings.register),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: BlocProvider(
              create: (context) => RegisterCubit(),
              child: Column(
                children: [
                  AppDimens.large.heightSizedBox,
                  GestureDetector(
                    onTap: () async {
                      await imageHandler.pickAndCropImage(
                          source: ImageSource.camera);
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          maxRadius: 45,
                          backgroundImage: imageHandler.getImage == null
                              ? AssetImage(Assets.images.avatarPng.path)
                              : FileImage(imageHandler.getImage!),
                        ),
                        AppDimens.small.heightSizedBox,
                        const Text(
                          AppStrings.chooseProfileImage,
                        ),
                      ],
                    ),
                  ),
                  AppDimens.medium.heightSizedBox,
                  TextFieldWidget(
                    title: AppStrings.nameLastName,
                    hint: AppStrings.hintNameLastName,
                    controller: _controllerNameLastName,
                  ),
                  AppDimens.medium.heightSizedBox,
                  TextFieldWidget(
                    title: AppStrings.homeNumber,
                    hint: AppStrings.hintHomeNumber,
                    controller: _controllerPhone,
                  ),
                  AppDimens.medium.heightSizedBox,
                  TextFieldWidget(
                    title: AppStrings.address,
                    hint: AppStrings.hintAddress,
                    controller: _controllerAddress,
                  ),
                  AppDimens.medium.heightSizedBox,
                  TextFieldWidget(
                    title: AppStrings.postalCode,
                    hint: AppStrings.hintPostalCode,
                    controller: _controllerPostalCode,
                  ),
                  AppDimens.medium.heightSizedBox,
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterLocationPickedState) {
                        if (state.location != null) {
                          _controllerLocation.text =
                              '${state.location!.latitude} - ${state.location!.longitude}';
                          lat = state.location!.latitude;
                          lng = state.location!.longitude;
                        }
                      }
                    },
                    builder: (context, state) {
                      return TextFieldWidget(
                        onTap: () async {
                          debugPrint("tap tap");
                          return await BlocProvider.of<RegisterCubit>(context)
                              .pickTheLocation(context: context);
                        },
                        readOnly: true,
                        title: AppStrings.location,
                        hint: AppStrings.hintLocation,
                        controller: _controllerLocation,
                        icon: const Icon(Icons.location_on_outlined),
                      );
                    },
                  ),
                  AppDimens.large.heightSizedBox,
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterOkResponseState) {
                        Navigator.pushNamed(context, ScreenNames.mainScreen);
                      } else if (state is RegisterErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('خطایی رخ داده است.')));
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButtomWidget(
                        title: (state is RegisterLoadingState)
                            ? const CircularProgressIndicator()
                            : Text(
                                AppStrings.register,
                                style: themeData.textTheme.labelMedium,
                              ),
                        onPressed: () async {
                          final UserRegisterModel user = UserRegisterModel(
                              name: _controllerNameLastName.text,
                              phone: _controllerPhone.text,
                              image: await MultipartFile.fromFile(
                                  imageHandler.getImage!.path),
                              address: _controllerAddress.text,
                              lat: lat,
                              lng: lng,
                              postalCode: _controllerPostalCode.text);

                          BlocProvider.of<RegisterCubit>(context)
                              .register(user: user);
                        },
                      );
                    },
                  ),
                  AppDimens.large.heightSizedBox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
