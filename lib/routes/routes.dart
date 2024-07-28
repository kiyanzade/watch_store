import 'package:flutter/material.dart';
import 'package:watch_store_app/routes/screen_names.dart';
import 'package:watch_store_app/screens/main_screen/main_screen.dart';
import 'package:watch_store_app/screens/register_screen.dart';
import 'package:watch_store_app/screens/send_otp_screen.dart';
import 'package:watch_store_app/screens/verify_otp_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenNames.root: (context) => const SendOtpScreen(),
  ScreenNames.registerScreen: (context) => const RegisterScreen(),
  ScreenNames.verifyOtpScreen: (context) => const VerifyOtpScreen(),
  ScreenNames.sendOtpScreen: (context) => const SendOtpScreen(),
  ScreenNames.mainScreen: (context) =>  MainScreen()
};
