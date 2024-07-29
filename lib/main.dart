import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:watch_store_app/components/theme.dart';
import 'package:watch_store_app/routes/routes.dart';
import 'package:watch_store_app/routes/screen_names.dart';
import 'package:watch_store_app/screens/authentication/cubit/auth_cubit.dart';
import 'package:watch_store_app/screens/main_screen/main_screen.dart';
import 'package:watch_store_app/screens/product_detail_screen.dart';
import 'package:watch_store_app/screens/product_list_screen.dart';
import 'package:watch_store_app/screens/register_screen.dart';
import 'package:watch_store_app/screens/authentication/send_otp_screen.dart';
import 'package:watch_store_app/screens/authentication/verify_otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("fa", "IR"),
        ],
        locale: const Locale("fa", "IR"),
        title: 'Flutter Demo',
        theme: lightThemeData,
        // initialRoute: ScreenNames.root,
        routes: routes,
        home: SendOtpScreen(),

        //  BlocBuilder<AuthCubit, AuthState>(
        //   builder: (context, state) {
        //     if (state is AuthLoggedInState) {
        //       return const MainScreen();
        //     } else if (state is AuthLoggedOutState) {
        //       return  SendOtpScreen();
        //     } else {
        //       return  SendOtpScreen();
        //     }
        //   },
        // ),
      ),
    );
  }
}
