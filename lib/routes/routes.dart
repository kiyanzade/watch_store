import 'package:flutter/material.dart';
import 'package:watch_store_app/routes/screen_names.dart';
import 'package:watch_store_app/screens/main_screen/main_screen.dart';
import 'package:watch_store_app/screens/register/register_screen.dart';
import 'package:watch_store_app/screens/authentication/send_otp_screen.dart';
import 'package:watch_store_app/screens/authentication/verify_otp_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenNames.sendOtpScreen: (context) => SendOtpScreen(),
  ScreenNames.registerScreen: (context) => const RegisterScreen(),
  ScreenNames.verifyOtpScreen: (context) =>  VerifyOtpScreen(),
  ScreenNames.mainScreen: (context) => const MainScreen()
  // TODO root splash screen
};
